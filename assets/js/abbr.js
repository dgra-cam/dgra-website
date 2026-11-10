// Wrap known abbreviations from data/abbr.yaml in <abbr title="..."> tags.
// This file is a Hugo template: the dictionary is injected at build time.
(() => {
  const ABBR = {{ site.Data.abbr | default dict | jsonify }};
  const root = document.querySelector('main');
  const keys = Object.keys(ABBR).sort((a, b) => b.length - a.length);
  if (!root || !keys.length) return;

  // Do not touch text inside these elements.
  const SKIP = 'h1, abbr, code, pre, kbd, samp, script, style, textarea, svg, .no-abbr';

  const esc = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  // Whole words only, with an optional plural "s" left outside the tag.
  const re = new RegExp(
    `(?<![\\p{L}\\p{N}_])(?:${keys.map(esc).join('|')})(?=s?(?![\\p{L}\\p{N}_]))`,
    'gu',
  );

  // Collect matching text nodes first, as the tree must not change while
  // we walk it.
  const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT, {
    acceptNode(node) {
      if (node.parentElement.closest(SKIP)) return NodeFilter.FILTER_REJECT;
      re.lastIndex = 0;
      return re.test(node.data) ? NodeFilter.FILTER_ACCEPT : NodeFilter.FILTER_REJECT;
    },
  });
  const nodes = [];
  while (walker.nextNode()) nodes.push(walker.currentNode);

  for (const node of nodes) {
    const text = node.data;
    const frag = document.createDocumentFragment();
    let last = 0;
    for (const m of text.matchAll(re)) {
      frag.append(text.slice(last, m.index));
      const abbr = document.createElement('abbr');
      abbr.title = ABBR[m[0]];
      abbr.textContent = m[0];
      frag.append(abbr);
      last = m.index + m[0].length;
    }
    frag.append(text.slice(last));
    node.replaceWith(frag);
  }
})();

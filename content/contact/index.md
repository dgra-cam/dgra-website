---
title: 'Contact Us'
---

{{< blocks/cover title="Contact Us" image_anchor="center" height="full" color="primary" >}}

<div class="fs-3 fw-normal text-start" style="max-width: 600px; margin: auto;">
  <form action="https://api.web3forms.com/submit" method="post">
    <div class="mb-4">
      <label class="form-label" for="name">Your name</label>
      <input class="form-control" type="text" id="name" name="name" placeholder="Your name">
    </div>
    <div class="mb-4">
      <label class="form-label" for="email">Your contact email</label>
      <input class="form-control" type="email" id="email" name="email" placeholder="user@example.com">
    </div>
    <div class="mb-4">
      <label class="form-label" for="subject">Subject</label>
      <input class="form-control" type="text" id="subject" name="subject" placeholder="What do you want to talk about?">
    </div>
    <div class="mb-4">
      <label class="form-label" for="message">Message</label>
      <textarea class="form-control" id="message" name="message" placeholder="How can we help?" rows="8" required></textarea>
    </div>
    <input type="hidden" name="redirect" value="https://web3forms.com/success">
    <input type="hidden" name="access_key" value="2bff46a8-5e06-4a8f-8bee-c2cb30a0f2a3">
    <button type="submit" class="btn btn-lg btn-secondary w-100 mb-4">
      Submit <i class="fa-solid fa-circle-right ms-2"></i>
    </button>
  </form>
</div>

Submissions handled via [Web3Forms](https://web3forms.com/),
see their [Privacy Policy](https://web3forms.com/privacy)
{.small}

<img class="m-2" src="/logo.svg" width="150px" alt="Darwin Green Residents’ Association Logo" />

If you prefer, you can email us directly at <hello@dgra.cam>
{.fw-normal}

For suggestions about this website, you can also
<a class="fw-normal" href="https://github.com/dgra-cam/dgra-website/issues/new">create an Issue on GitHub</a>

{{< /blocks/cover >}}

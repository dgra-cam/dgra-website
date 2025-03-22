---
title: 'Contact Us'
---

{{< blocks/cover title="Contact Us" image_anchor="center" height="full" color="primary" >}}

<div class="fs-3 fw-normal text-start" style="max-width: 600px; margin: auto;">
  <form action="https://fabform.io/f/Kwpw95t" method="post">
    <div class="mb-4">
      <label class="form-label" for="name">Your name</label>
      <input class="form-control" type="text" id="name" name="name" placeholder="Your name">
    </div>
    <div class="mb-4">
      <label class="form-label" for="email">Your contact email</label>
      <input class="form-control" type="email" id="email" name="email" placeholder="user@example.com">
    </div>
    <div class="mb-4">
      <label class="form-label" for="message">Message</label>
      <textarea class="form-control" id="message" name="message" placeholder="How can we help?" rows="8" required></textarea>
    </div>
    <button type="submit" class="btn btn-lg btn-secondary w-100 mb-4">
      Submit <i class="fa-solid fa-circle-right ms-2"></i>
    </button>
  </form>
</div>

For suggestions about the website, you can also [create an Issue on GitHub](https://github.com/dgra-cam/dgra-website/issues/new).
{.fw-normal}

<script>
    const form = document.querySelector('form');
    form.addEventListener('submit', async function (e) {
        e.preventDefault();

        const formData = new FormData(form);
        const response = await fetch('https://fabform.io/f/Kwpw95t', {
            method: 'POST',
            body: formData,
        });

        // Handle the response as needed
        console.log(response);
    });
</script>

{{< /blocks/cover >}}

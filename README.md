<img src=".github/dgra-green.svg" width="300" alt="DGRA logo">

# DGRA website

[![License: CC BY-NC 4.0](https://img.shields.io/badge/License-CC_BY--NC_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc/4.0/)
[![Netlify Status](https://api.netlify.com/api/v1/badges/e818937d-c355-4e6c-9fc9-f2214f766831/deploy-status)](https://app.netlify.com/sites/dgra/deploys)

## Run the website

This website uses a static site generator called [Hugo], implemented in [Go].
It uses a theme for Hugo called [Docsy]. It is published on [Netlify].

Rather than installing Go and Hugo, you can generate and run the website
locally on your machine in a [Docker] container. If you have `make` and
`docker` installed, simply type the following commands in a console:

```console
$ cd <repository-path>
$ make
```

This command should pull a Docker image and use it to build, then serve, the
website from a container. To view the generated website, open a web browser and
go to http://localhost:1313. To stop the preview and get back to the command
prompt, hit `Control + C` in the console.

For more details about the Docker commands, look at the `Makefile`.

Note that creating a Pull Request also causes Netlify to generate a preview to
visualise the changes.

[Hugo]: https://gohugo.io/
[Go]: https://go.dev/
[Docsy]: https://www.docsy.dev/
[Netlify]: https://www.netlify.com/
[Docker]: https://www.docker.com/

## Contribute

Did you find a typo, or a missing piece of information? Do you have ideas for a
new page or for a blog post? Please [open an Issue][issue], or—even
better!—[create a Pull Request][pr].

[issue]: https://github.com/dgra-cam/site-dgra-dev/issues/new
[pr]: https://github.com/dgra-cam/site-dgra-dev/compare

## License

The code for the website structure is mostly inherited from Docsy, which is
published under the [Apache License 2.0][apache-2.0] (`Apache-2.0`).

The text contents, unless specified otherwise, are released under the [Creative
Commons Attribution Non Commercial 4.0 International license][cc-by-nc]
(`CC-BY-NC-4.0`). You are free to share and adapt the texts for non-commercial
purposes only, and as long as you provide attribution.

[apache-2.0]: https://www.apache.org/licenses/LICENSE-2.0.html
[cc-by-nc]: https://creativecommons.org/licenses/by-nc/4.0/

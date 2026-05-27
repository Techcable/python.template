# python.template.techcable
A modern template for my python projects.

Needed because python packaging & tooling is so complicated.

## Usage
Merge this repo into your project, or fork it to begin a new project.

Replace the identifiers of the form `${TPROJECT_*}`,
then delete all repo-specific files in the `template` subdirectory.

### Tool Choices
- **Task Execution**: [Justfile] (plan to switch to [invoke] later)
- **Build**: pip, [hatch], uv
- **Type Checking**: Both [mypy](https://www.mypy-lang.org) and [ty](https://docs.astral.sh/ty/)
- **Linting**: ruff, [typos] (spellchecker like codespell)
- **Formatting**: ruff, [tombi]
- **Testing**: pytest, hatch

[typos]: https://github.com/crate-ci/typos
[Justfile]: https://just.systems
[pyinvoke]: https://pyinvoke.org/
[hatch]: https://hatch.pypa.io/latest/
[tombi]: http://tombi-toml.github.io/tombi/

### See Also
- [jaraco/skeleton](https://github.com/jaraco/skeleton) and [blog post](https://blog.jaraco.com/skeleton/).
- [cookiecutter](https://github.com/cookiecutter/cookiecutter) project templating system
  - Attempted to use in [Techcable/cookiecutter-python-minimal](https://github.com/Techcable/cookiecutter-python-minimal).
    Eventually abandoned due to more complicated merging.

## License
This template repository, including all the scripts in it are licensed under either the [Apache 2.0 License](./LICENSE-APACHE.txt) or [MIT License](./LICENSE-MIT.txt) at your option.

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in this project by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any additional terms or conditions.

# `util`

Custom utility scripts


**`autorun_spec.sh`**

> _Depends on:_ **make**

Automatically re-run a spec when the source changes.

    autorun_spec.sh

**`new_nix_env.sh`**

> _Depends on:_
> - **make**
> - **nix**

Create a new environment using nix.

    new_nix_env.sh "python" path/to/python-code
    new_nix_env.sh "javascript" path/to/javascript-code

**`new_docker_env.sh`**

> _Depends on:_
> - **make**
> - **docker**

Create a new environment using docker.

    new_docker_env.sh "rails" path/to/rails-code



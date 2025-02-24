FROM ocaml/opam:ubuntu-24.04-opam AS base
# Set up working directory
RUN sudo apt-get update && sudo apt-get install pkg-config libffi-dev libsdl2-dev --yes
WORKDIR /work

# Copy project files
COPY . /work

RUN opam init --disable-sandboxing
RUN opam switch create ocamlboy ocaml-base-compiler.4.13.1 --yes
# RUN eval $(opam env)
RUN eval $(opam env --switch=ocamlboy --set-switch)
RUN opam install . --deps-only --with-test --yes
RUN opam exec -- dune build --profile release
RUN opam exec -- dune runtest
ENTRYPOINT ["opam", "config", "exec", "--"]
CMD ["bash"]

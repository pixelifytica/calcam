{
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cython,
  numpy,
}:
let
  pname = "triangle";
  version = "v20230923";
in
buildPythonPackage {
  inherit pname version;
  src = fetchFromGitHub {
    owner = "drufat";
    repo = pname;
    rev = version;
    hash = "sha256-S324XlaDHcXRFK0Gcm1UuS0phb2hOpuYGcw3YFs7i6I=";
    fetchSubmodules = true;
  };
  doCheck = false;
  build-system = [
    setuptools
    cython
  ];
  dependencies = [
    setuptools
    cython
    numpy
  ];
}

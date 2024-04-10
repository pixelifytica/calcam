{
  buildPythonPackage,
  libsForQt5,
  setuptools,
  scipy,
  matplotlib,
  vtk,
  pyqt5,
  opencv4,
  h5py,
}:
buildPythonPackage {
  pname = "calcam";
  version = builtins.readFile ./calcam/__version__;
  src = ./.;
  pyproject = true;
  doChecks = false;
  nativeBuildInputs = [
    setuptools
    libsForQt5.wrapQtAppsHook
  ];
  propagatedBuildInputs = [
    scipy
    matplotlib
    vtk
    pyqt5
    opencv4
    h5py
    # triangle  # TODO
  ];
}

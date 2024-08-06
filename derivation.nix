{
  lib,
  buildPythonPackage,
  libsForQt5,
  setuptools,
  scipy,
  matplotlib,
  vtk,
  pyqt5,
  h5py,
  triangle,
  opencv4,
}:
buildPythonPackage {
  pname = "calcam";
  version = builtins.readFile ./calcam/__version__;
  src = ./.;
  pyproject = true;
  dontCheckRuntimeDeps = true; # opencv-python-headless...
  build-system = [
    setuptools
    libsForQt5.wrapQtAppsHook
  ];
  dependencies = [
    libsForQt5.qtbase
    libsForQt5.qtwayland
    setuptools
    scipy
    matplotlib
    vtk
    pyqt5
    h5py
    triangle
    opencv4
  ];
  meta = {
    description = "Spatial calibration tools for science & engineering camera systems.";
    homepage = "https://github.com/euratom-software/calcam";
    license = lib.licenses.eupl11;
    maintainers = [ ];
  };
}

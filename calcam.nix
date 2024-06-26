{
  lib,
  buildPythonPackage,
  fetchPypi,
  libsForQt5,
  setuptools,
  scipy,
  matplotlib,
  vtk,
  pyqt5,
  h5py,
  triangle,
  opencv4,
}: let
  opencv-python-headless = opencv4.overrideAttrs {
    pname = "opencv-python-headless";
    enablePython = true;
    enableVtk = true;
    enabledModules = ["ENABLE_HEADLESS"];
  };
  vtkWithQt = vtk.overrideAttrs {enableQt = true;};
in
  buildPythonPackage {
    pname = "calcam";
    version = builtins.readFile ./calcam/__version__;
    src = ./.;
    pyproject = true;
    dontCheckRuntimeDeps = true; # opencv-python-headless...
    nativeBuildInputs = [setuptools libsForQt5.wrapQtAppsHook];
    propagatedBuildInputs = with libsForQt5; [
      wrapQtAppsHook
      qtbase
      qtwayland
      setuptools
      scipy
      matplotlib
      # vtkWithQt
      vtk
      pyqt5
      h5py
      triangle
      opencv-python-headless
    ];
    meta = {
      description = "Spatial calibration tools for science & engineering camera systems.";
      homepage = "https://github.com/euratom-software/calcam";
      license = lib.licenses.eupl11;
      maintainers = [];
    };
  }

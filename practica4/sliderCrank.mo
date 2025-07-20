package tp4
   
model BielaManivela
    DSFLib.Mechanical.Translational.Interfaces.Flange flangeTras annotation(
      Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {102, 0}, extent = {{-10, -10}, {10, 10}})));
    DSFLib.Mechanical.Rotational.Interfaces.Flange flangeRot annotation(
      Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(extent = {{-10, -10}, {10, 10}})));
    parameter Real L(unit = "m") = 0.1 "Longitud biela";
    parameter Real r(unit = "m") = 0.01 "Radio manivela";
    parameter DSFLib.Mechanical.Translational.Units.Position s0 = 0;
  equation
    flangeTras.s - s0 = r*cos(flangeRot.phi) + L*sqrt(1 - (r/L*sin(flangeRot.phi))^2);
    flangeRot.tau*(flangeTras.s - r*cos(flangeRot.phi)) = flangeTras.f*(r*flangeTras.s*sin(flangeRot.phi));
    annotation(
      Icon(graphics = {Ellipse(origin = {-1, 1}, extent = {{-27, 27}, {27, -27}}), Line(origin = {27, 22}, points = {{-25, 6}, {67, -22}})}));
  end BielaManivela;

  model ejemplo1
  BielaManivela bielaManivela annotation(
      Placement(transformation(origin = {-14, 0}, extent = {{-26, -26}, {26, 26}})));
  DSFLib.Mechanical.Translational.Components.Fixed fixed annotation(
      Placement(transformation(origin = {84, 0}, extent = {{-12, -12}, {12, 12}}, rotation = 90)));
  DSFLib.Mechanical.Translational.Components.Damper damper(b = 1000)  annotation(
      Placement(transformation(origin = {58, 0}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Mechanical.Translational.Components.Mass mass annotation(
      Placement(transformation(origin = {32, 0}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Mechanical.Rotational.Components.Inertia inertia annotation(
      Placement(transformation(origin = {0, 40}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Mechanical.Rotational.Components.ConstTorque constTorque annotation(
      Placement(transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Mechanical.Rotational.Components.Fixed fixed1 annotation(
      Placement(transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  equation
  connect(fixed.flange, damper.flange_b) annotation(
      Line(points = {{84, 0}, {68, 0}}));
  connect(damper.flange_a, mass.flange) annotation(
      Line(points = {{48, 0}, {32, 0}}));
  connect(mass.flange, bielaManivela.flangeTras) annotation(
      Line(points = {{32, 0}, {12, 0}}));
  connect(constTorque.flange_b, bielaManivela.flangeRot) annotation(
      Line(points = {{-40, 0}, {-14, 0}}));
  connect(inertia.flange, bielaManivela.flangeRot) annotation(
      Line(points = {{-10, 40}, {-28, 40}, {-28, 0}, {-14, 0}}));
  connect(constTorque.flange_a, fixed1.flange) annotation(
      Line(points = {{-60, 0}, {-80, 0}}));
  annotation(
      Diagram);
end ejemplo1;

  model checkValve
  extends DSFLib.Hydraulics.Interfaces.TwoPort;
  parameter Real Ron(unit = "Pa.s/m3") = 10^(-6) "Resistencia hidráulica";
  parameter Real Roff(unit = "Pa.s/m3") = 10^(12) "Resistencia hidráulica";
  equation
  p = if q>0 then Ron*q else Roff*q;
  annotation(
      Diagram(graphics),
      Icon(graphics = {Polygon(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-100, 50}, {100, -50}, {100, 50}, {0, 0}, {-100, -50}, {-100, 50}}), Line(origin = {0, 1}, points = {{-100, 1}, {100, -1}, {100, -1}}), Polygon(origin = {80, -1}, points = {{-2, 7}, {-4, -7}, {4, 1}, {4, 1}, {-2, 7}})}));
end checkValve;

  model ejemplo2
  checkValve checkValve1 annotation(
      Placement(transformation(origin = {-38, 0}, extent = {{-10, -10}, {10, 10}})));
  checkValve checkValve2 annotation(
      Placement(transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Hydraulics.Components.Valve valve(RH = 1e7)  annotation(
      Placement(transformation(origin = {2, 18}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DSFLib.Hydraulics.Components.Tank tank(v.start = 1) annotation(
      Placement(transformation(origin = {2, 56}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Hydraulics.Components.ConstPress constPress annotation(
      Placement(transformation(origin = {-72, -22}, extent = {{-10, -10}, {10, 10}})));
  equation
  connect(constPress.fluidPort, checkValve1.fluidPort_b) annotation(
      Line(points = {{-62, -22}, {-48, -22}, {-48, 0}}));
  connect(checkValve1.fluidPort_a, checkValve2.fluidPort_b) annotation(
      Line(points = {{-28, 0}, {30, 0}}));
  connect(valve.fluidPort_a, checkValve2.fluidPort_b) annotation(
      Line(points = {{2, 8}, {2, 0}, {30, 0}}));
  connect(valve.fluidPort_b, tank.fluidPort) annotation(
      Line(points = {{2, 28}, {2, 46}}));
  connect(checkValve2.fluidPort_a, constPress.fluidPort) annotation(
      Line(points = {{50, 0}, {50, -22}, {-62, -22}}));
  end ejemplo2;

  model aspirantImpelent
  BielaManivela bielaManivela annotation(
      Placement(transformation(origin = {-57, 1}, extent = {{-23, -23}, {23, 23}})));
  DSFLib.MultiDomain.HydroMechanical.Components.PistonCylinder pistonCylinder(A = 0.001)  annotation(
      Placement(transformation(origin = {2, 0}, extent = {{-18, -18}, {18, 18}}, rotation = 180)));
  DSFLib.Mechanical.Rotational.Interfaces.Flange flange annotation(
      Placement(transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-72, -2}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Hydraulics.Interfaces.FluidPort fluidInput annotation(
      Placement(transformation(origin = {52, -36}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {20, -42}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Hydraulics.Interfaces.FluidPort fluidOutput annotation(
      Placement(transformation(origin = {52, 72}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {20, 62}, extent = {{-10, -10}, {10, 10}})));
  checkValve checkValve1 annotation(
      Placement(transformation(origin = {52, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  checkValve checkValve2 annotation(
      Placement(transformation(origin = {52, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  DSFLib.Mechanical.Translational.Components.Fixed fixed annotation(
      Placement(transformation(origin = {20, -42}, extent = {{-10, -10}, {10, 10}})));
  equation
  connect(pistonCylinder.flange_b, bielaManivela.flangeTras) annotation(
      Line(points = {{-16, 0}, {-25, 0}, {-25, 2}, {-34, 2}}));
  connect(bielaManivela.flangeRot, flange) annotation(
      Line(points = {{-56, 2}, {-90, 2}}));
  connect(checkValve2.fluidPort_a, checkValve1.fluidPort_b) annotation(
      Line(points = {{52, 12}, {52, 28}}));
  connect(pistonCylinder.fluidPort, checkValve2.fluidPort_a) annotation(
      Line(points = {{10, 14}, {52, 14}, {52, 12}}));
  connect(fluidInput, checkValve2.fluidPort_b) annotation(
      Line(points = {{52, -36}, {52, -8}}));
  connect(checkValve1.fluidPort_a, fluidOutput) annotation(
      Line(points = {{52, 48}, {52, 72}}));
  connect(fixed.flange, pistonCylinder.flange_a) annotation(
      Line(points = {{20, -42}, {20, 0}}));
  annotation(
      Icon(graphics = {Line(origin = {-24.7941, 10.2415}, points = {{42.7941, 51.7585}, {-45.2059, -12.2415}, {44.7941, -52.2415}, {44.7941, 51.7585}, {44.7941, 51.7585}}), Line(origin = {-6, 5.2042}, points = {{0, -23.2042}, {0, 22.7958}, {-10, 10.7958}, {10, 10.7958}, {0, 22.7958}, {0, 22.7958}})}));
end aspirantImpelent;

  model ejemplo3
  aspirantImpelent aspirantImpelent1 annotation(
      Placement(transformation(origin = {3, -3}, extent = {{-31, -31}, {31, 31}})));
  DSFLib.Mechanical.Rotational.Components.Inertia inertia annotation(
      Placement(transformation(origin = {-34, 42}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Mechanical.Rotational.Components.ConstTorque constTorque annotation(
      Placement(transformation(origin = {-60, -2}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Mechanical.Rotational.Components.Fixed fixed annotation(
      Placement(transformation(origin = {-88, -2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DSFLib.Hydraulics.Components.ConstPress constPress annotation(
      Placement(transformation(origin = {-22, -60}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Hydraulics.Components.Valve valve(RH = 1e8)  annotation(
      Placement(transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}})));
  equation
  connect(inertia.flange, constTorque.flange_b) annotation(
      Line(points = {{-44, 42}, {-50, 42}, {-50, -2}}));
  connect(constTorque.flange_a, fixed.flange) annotation(
      Line(points = {{-70, -2}, {-88, -2}}));
  connect(aspirantImpelent1.flange, constTorque.flange_b) annotation(
      Line(points = {{-20, -4}, {-50, -4}, {-50, -2}}));
  connect(aspirantImpelent1.fluidInput, constPress.fluidPort) annotation(
      Line(points = {{10, -16}, {10, -60}, {-12, -60}}));
  connect(aspirantImpelent1.fluidOutput, valve.fluidPort_b) annotation(
      Line(points = {{10, 16}, {10, 60}, {40, 60}}));
  connect(valve.fluidPort_a, constPress.fluidPort) annotation(
      Line(points = {{60, 60}, {78, 60}, {78, -60}, {-12, -60}}));
  end ejemplo3;

  model SistemaCompleto
  DSFLib.MultiDomain.ElectroMechanical.Components.DCMotor dCMotor(R = 0.1, L = 10^(-3))  annotation(
      Placement(transformation(origin = {-72, -16}, extent = {{-14, -14}, {14, 14}})));
  aspirantImpelent aspirantImpelent1 annotation(
      Placement(transformation(origin = {-10, -18}, extent = {{-16, -16}, {16, 16}})));
  DSFLib.Hydraulics.Components.ConstPress constPress annotation(
      Placement(transformation(origin = {-22, -60}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Hydraulics.Components.Tank tank annotation(
      Placement(transformation(origin = {22, 36}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Hydraulics.Components.Valve valve(RH = 10^7)  annotation(
      Placement(transformation(origin = {62, 26}, extent = {{-10, -10}, {10, 10}})));
  DSFLib.Hydraulics.Components.Column column(H = 1)  annotation(
      Placement(transformation(origin = {-6, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  DSFLib.Hydraulics.Components.ConstPress constPress1 annotation(
      Placement(transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  DSFLib.Circuits.Components.ConstVolt constVolt(V = 12)  annotation(
      Placement(transformation(origin = {-74, 24}, extent = {{-10, -10}, {10, 10}})));
  equation
  connect(aspirantImpelent1.flange, dCMotor.flange) annotation(
      Line(points = {{-22, -18}, {-60, -18}}));
  connect(constPress.fluidPort, aspirantImpelent1.fluidInput) annotation(
      Line(points = {{-12, -60}, {-6, -60}, {-6, -24}}));
  connect(tank.fluidPort, valve.fluidPort_b) annotation(
      Line(points = {{22, 26}, {52, 26}}));
  connect(aspirantImpelent1.fluidOutput, column.fluidPort_b) annotation(
      Line(points = {{-6, -8}, {-6, 6}}));
  connect(column.fluidPort_a, tank.fluidPort) annotation(
      Line(points = {{-6, 26}, {22, 26}}));
  connect(constPress1.fluidPort, valve.fluidPort_a) annotation(
      Line(points = {{86, 0}, {72, 0}, {72, 26}}));
  connect(constVolt.p, dCMotor.n) annotation(
      Line(points = {{-84, 24}, {-90, 24}, {-90, 11}, {-80, 11}, {-80, -2}}));
  connect(constVolt.n, dCMotor.p) annotation(
      Line(points = {{-64, 24}, {-64, -2}}));
  end SistemaCompleto;
end tp4;

model Q18
  extends ModelWorkspace;
  import SysplorerEmbeddedCoder.Types.*;
  import BaseWorkspace.*;
  annotation(__MWORKS(version="2025a",modelType=Control,PortArrangement,BlockSystem(blockKind=BlockKind.userModel,SampleTime(auto=true,group="")=0.8),SysblockVersion="1.0",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0,ContinueTimeVector)),Icon(coordinateSystem(preserveAspectRatio=false)),experiment(Algorithm=Dassl,Interval=-1,InlineIntegrator=false,InlineStepSize=false,StartTime=0,StopTime=40,Tolerance=0.0001),Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2})));
  SysplorerEmbeddedCoder.Sources.Clock t 
    annotation (Placement(transformation(origin={-134.67,-5.93733}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.MathOperation.Gain gain(k=-3) 
    annotation (Placement(transformation(origin={-80.694,-6.20719}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=1) ,k(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.MathOperation.Gain gain1(k=-5) 
    annotation (Placement(transformation(origin={-80.9639,-43.4506}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=1) ,k(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.MathOperation.MathFunction mathFunction 
    annotation (Placement(transformation(origin={-36.7036,-6.47714}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.MathOperation.MathFunction mathFunction1 
    annotation (Placement(transformation(origin={-36.9735,-43.9904}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Sources.SineWave sineWave(phase=1.04719755,frequency=4,bias=0,amplitude=1,timeSource=SysplorerEmbeddedCoder.MathOperation.SineWaveFunction.TimeSourceType.simulationTime) 
    annotation (Placement(transformation(origin={-36.4478,-79.7061}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(SampleTime(auto=false)=0 ,Instance(y(Dimension=1) ,amplitude(Dimension=1) ,bias(Dimension=1) ,frequency(Dimension=1) ,phase(Dimension=1)))));
  SysplorerEmbeddedCoder.MathOperation.Product product1(isSaturate=false,inputs="**") 
    annotation (Placement(transformation(origin={14.8434,-62.9383}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u(u1(Type(ref="double") ,Dimension=1) ,u2(Type(ref="double") ,Dimension=1)) ,y(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0,Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
  SysplorerEmbeddedCoder.MathOperation.Sum sum1(isSaturate=false,inputs="++") 
    annotation (Placement(transformation(origin={68.5389,-31.3165}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u(u1(Type(ref="double") ,Dimension=1) ,u2(Type(ref="double") ,Dimension=1)) ,y(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0,Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="+",instance="u2")))));
  SysplorerEmbeddedCoder.Continuous.Integrator y3(initCond=0.2,externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None) 
    annotation (Placement(transformation(origin={-134.4,76.9157}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Dimension=1) ,y(Dimension=1) ,initCond(Dimension=1) ,absoluteTolerance(Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Continuous.Integrator y2(initCond=0.5,externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None) 
    annotation (Placement(transformation(origin={-87.4411,76.9157}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Dimension=1) ,y(Dimension=1) ,initCond(Dimension=1) ,absoluteTolerance(Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Continuous.Integrator y1(initCond=0.5,externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None) 
    annotation (Placement(transformation(origin={-43.4507,76.9157}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Dimension=1) ,y(Dimension=1) ,initCond(Dimension=1) ,absoluteTolerance(Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Continuous.Integrator y(initCond=1,externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None) 
    annotation (Placement(transformation(origin={1.07942,76.6458}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Dimension=1) ,y(Dimension=1) ,initCond(Dimension=1) ,absoluteTolerance(Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.MathOperation.Sum sum2(isSaturate=false,inputs="++++") 
    annotation (Placement(transformation(origin={67.8747,28.8771}, 
extent={{-9.59518,-22.1446},{9.59518,22.1446}})),__MWORKS(BlockSystem(Instance(u(u1(Type(ref="double") ,Dimension=1) ,u2(Type(ref="double") ,Dimension=1) ,u3(Type(ref="double") ,Dimension=1) ,u4(Type(ref="double") ,Dimension=1)) ,y(Type(ref="double") ,Dimension=1)),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap) ,SampleTime(group="D0")=0),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="+",instance="u2"),label(text="+",instance="u3"),label(text="+",instance="u4"))),ComponentNamePlacement(BOTTOM)));
  SysplorerEmbeddedCoder.MathOperation.Gain gain2(k=2) 
    annotation (Placement(transformation(origin={29.6867,45.6097}, 
extent={{-5.68193,-5.68193},{5.68193,5.68193}})),__MWORKS(ComponentNamePlacement(BOTTOM),BlockSystem(Instance(u(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=1) ,k(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.MathOperation.Gain gain3(k=4) 
    annotation (Placement(transformation(origin={9.98554,34.2747}, 
extent={{-5.68193,-5.68193},{5.68193,5.68193}})),__MWORKS(ComponentNamePlacement(BOTTOM),BlockSystem(Instance(u(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=1) ,k(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.MathOperation.Gain gain4(k=6) 
    annotation (Placement(transformation(origin={29.6867,23.2097}, 
extent={{-5.68193,-5.68193},{5.68193,5.68193}})),__MWORKS(ComponentNamePlacement(BOTTOM),BlockSystem(Instance(u(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=1) ,k(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.MathOperation.Gain gain5(k=5) 
    annotation (Placement(transformation(origin={10.5253,11.6049}, 
extent={{-5.68193,-5.68193},{5.68193,5.68193}})),__MWORKS(ComponentNamePlacement(BOTTOM),BlockSystem(Instance(u(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=1) ,k(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  Scope scope 
    annotation (Placement(transformation(origin={68.2795,76.106}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.MathOperation.Sum sum3(isSaturate=false,inputs="-+") 
    annotation (Placement(transformation(origin={128.733,-1.88915}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u(u1(Type(ref="double") ,Dimension=1) ,u2(Type(ref="double") ,Dimension=1)) ,y(Type(ref="double") ,Dimension=1)),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap) ,SampleTime(group="D0")=0),PortLabels(labelType="CustomType",labels(label(text="-",instance="u1"),label(text="+",instance="u2")))));
  model ModelWorkspace
    annotation(__MWORKS(hide = true,BlockSystem(blockKind=BlockKind.modelWorkspace)));
  end ModelWorkspace;
  block Scope "显示仿真过程中生成的信号"

    parameter String displayFormat = "y(t)" annotation(HideResult = true);

    parameter String showOnSimulator = "false" annotation(HideResult = true);

    SysplorerEmbeddedCoder.Types.InputAuto u1 
       annotation (Placement(transformation(origin={-110,0}, 
      extent={{-10,-10},{10,10}}), 
      iconTransformation(origin={-101.8,0}, 
      extent={{-1.8,-1.8},{1.8,1.8}})), 
        __MWORKS(BlockSystem(AllowDimension(choices(choice=DimensionType.scalar, 
       choice=DimensionType.array1D, 
  choice=DimensionType.scalar,choice=DimensionType.rowVector2D,choice=DimensionType.columnVector2D,choice=DimensionType.array2D)), 
        AllowType(choices(choice = "double", choice = "float", choice = "int8", choice = "uint8", choice = "int16", choice = "uint16", choice = "int32", 
        choice = "uint32", choice = "string", choice = "boolean", choice = "enum")))));

    annotation(__MWORKS(BlockSystem(blockKind=Types.BlockKind.atomic, bltBlockKind=Types.BltBlockKind.scope),PortArrangement(Left(u1)),sourceModel=SysplorerEmbeddedCoder.Utilities.Scope,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-100,-100},{100,100}}, 
      grid={2,2}),graphics = {Rectangle(origin={0,0}, 
      fillColor={255,255,255}, 
      fillPattern=FillPattern.Solid, 
      extent={{-100,100},{100,-100}}), Rectangle(origin={1,54.5}, 
      fillColor={255,255,255}, 
      fillPattern=FillPattern.Solid, 
      extent={{-79,24.5},{79,-24.5}}, 
      radius=10),Text(origin={0,-126}, 
      lineColor={0,0,0}, 
      extent={{0,-20},{0,20}}, 
      textString="%name", 
      fontSize=14, 
      textColor={0,0,0}, 
      verticalAlignment=TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

  end Scope;
equation
  connect(t.y, gain.u) 
  annotation(Line(origin={-105,-7}, 
points={{-17.87,1.06267},{12.506,1.06267},{12.506,0.792807}}, 
color={0,0,0}));
  connect(t.y, gain1.u) 
  annotation(Line(origin={-108,-25}, 
points={{-14.87,19.06267},{0.0481928,19.06267},{0.0481928,-18.4506},{15.2361,-18.4506}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(gain.y, mathFunction.u1) 
  annotation(Line(origin={-59,-6}, 
points={{-9.894,-0.20719},{10.4964,-0.20719},{10.4964,-0.477137}}, 
color={0,0,0}));
  connect(gain1.y, mathFunction1.u1) 
  annotation(Line(origin={-59,-43}, 
points={{-10.1639,-0.4506},{10.2265,-0.4506},{10.2265,-0.990363}}, 
color={0,0,0}));
  connect(mathFunction1.y, product1.u1) 
  annotation(Line(origin={-11,-53}, 
points={{-14.1735,9.0096},{-1.68434,9.0096},{-1.68434,-4.93833},{14.0434,-4.93833}}, 
color={0,0,0}));
  connect(sineWave.y, product1.u2) 
  annotation(Line(origin={-11,-79}, 
points={{-13.6478,-0.706089},{-1.41446,-0.706089},{-1.41446,11.0617},{14.0434,11.0617}}, 
color={0,0,0}));
  connect(mathFunction.y, sum1.u1) 
  annotation(Line(origin={20,-17}, 
points={{-44.9036,10.52286},{20.212,10.52286},{20.212,-9.31654},{36.7389,-9.31654}}, 
color={0,0,0}));
  connect(product1.y, sum1.u2) 
  annotation(Line(origin={46,-52}, 
points={{-19.3566,-10.9383},{-5.24819,-10.9383},{-5.24819,15.6835},{10.7389,15.6835}}, 
color={0,0,0}));
  connect(y3.y, y2.u1) 
  annotation(Line(origin={-111,77}, 
  points={{-11.5999,-0.084312},{11.7589,-0.0843253}}, 
  color={0,0,0}));
  connect(y2.y, y1.u1) 
  annotation(Line(origin={-65,77}, 
points={{-10.6411,-0.0843},{9.7493,-0.0843}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(y1.y, y.u1) 
  annotation(Line(origin={-23,77}, 
points={{-8.6507,-0.0843253},{12.2794,-0.0843253},{12.2794,-0.354205}}, 
color={0,0,0}));
  connect(gain2.y, sum2.u1) 
  annotation(Line(origin={46,45}, 
points={{-8.83137,0.6097},{10.4795,0.6097},{10.4795,0.48553}}, 
color={0,0,0}));
  connect(gain3.y, sum2.u2) 
  annotation(Line(origin={37,34}, 
points={{-19.53253,0.2747},{19.4795,0.2747},{19.4795,0.41323}}, 
color={0,0,0}));
  connect(gain4.y, sum2.u3) 
  annotation(Line(origin={46,23}, 
points={{-8.83137,0.2097},{10.4795,0.2097},{10.4795,0.34093}}, 
color={0,0,0}));
  connect(gain5.y, sum2.u4) 
  annotation(Line(origin={37,12}, 
points={{-18.99277,-0.3951},{19.4795,-0.3951},{19.4795,0.26863}}, 
color={0,0,0}));
  connect(y.y, gain2.u) 
  annotation(Line(origin={18,61}, 
points={{-5.12058,15.6458},{-0.99759,15.6458},{-0.99759,-15.3903},{4.20477,-15.3903}}, 
color={0,0,0}));
  connect(y1.y, gain3.u) 
  annotation(Line(origin={-15,56}, 
points={{-16.6507,20.9157},{-6.59036,20.9157},{-6.59036,-21.7253},{17.5036,-21.7253}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(y2.y, gain4.u) 
  annotation(Line(origin={-27,50}, 
  points={{-48.6411,26.9157},{-37.7711,26.9157},{-37.7711,-26.7903},{49.2048,-26.7903}}, 
  color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(y3.y, gain5.u) 
  annotation(Line(origin={-60,44}, 
points={{-62.6,32.9157},{-51.1904,32.9157},{-51.1904,-32.3951},{63.0434,-32.3951}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(y.y, scope.u1) 
  annotation(Line(origin={34,77}, 
points={{-21.1206,-0.3542},{22.4795,-0.3542},{22.4795,-0.893971}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(sum2.y, sum3.u1) 
  annotation(Line(origin={98,15}, 
points={{-18.73012,13.8771},{2.39518,13.8771},{2.39518,-11.8892},{18.9332,-11.8892}}, 
color={0,0,0}));
  connect(sum1.y, sum3.u2) 
  annotation(Line(origin={99,-21}, 
points={{-18.6611,-10.3165},{1.39518,-10.3165},{1.39518,14.11085},{17.933,14.11085}}, 
color={0,0,0}));
  connect(sum3.y, y3.u1) 
  annotation(Line(origin={-4,50}, 
  points={{144.533,-51.8892},{163.229,-51.8892},{163.229,51.2048},{-163.055,51.2048},{-163.055,26.9157},{-142.2,26.9157}}, 
  color={0,0,0}));
  end Q18;

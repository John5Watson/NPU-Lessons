model Q19
  extends ModelWorkspace;
  import SysplorerEmbeddedCoder.Types.*;
  import BaseWorkspace.*;
  annotation(__MWORKS(version="2025a",modelType=Control,PortArrangement,BlockSystem(blockKind=BlockKind.userModel,SampleTime(auto=true,group="")=0.8),SysblockVersion="1.0"),Icon(coordinateSystem(preserveAspectRatio=false)),experiment(Algorithm=Dassl,Interval=-1,InlineIntegrator=false,InlineStepSize=false,StartTime=0,StopTime=40,Tolerance=0.0001),Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2})));
  SysplorerEmbeddedCoder.Continuous.StateSpace stateSpace(B=[4,6;2,4;2,2;0,2],A=[2.25,-5,-1.25,-0.5;2.25,-4.25,-1.25,-0.25;0.25,-0.5,-1.25,-1;1.25,-1.75,-0.25,-0.75],C=[0,0,0,1;0,2,0,2],D=[0,0;0,0],x0=0) 
    annotation (Placement(transformation(origin={4.31805,-6.20725}, 
extent={{-19.4458,-30.5109},{19.4458,30.5109}})),__MWORKS(ComponentNamePlacement(BOTTOM),BlockSystem(Instance(u(Type(ref="double") ,Dimension=[2]) ,y(Type(ref="double") ,Dimension=[2]) ,absoluteTolerance(Type(ref="double") ,Dimension=1) ,A(Dimension=[4, 4]) ,B(Dimension=[4, 2]) ,C(Dimension=[2, 4]) ,D(Dimension=[2, 2]) ,x0(Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Sources.SineWave sineWave 
    annotation (Placement(transformation(origin={-90.4096,17.0024}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(y(Dimension=1) ,amplitude(Dimension=1) ,bias(Dimension=1) ,frequency(Dimension=1) ,phase(Dimension=1)))));
  SysplorerEmbeddedCoder.Sources.SineWave sineWave1(phase=3.14159265/2,frequency=1,bias=0,amplitude=1,timeSource=SysplorerEmbeddedCoder.MathOperation.SineWaveFunction.TimeSourceType.simulationTime) 
    annotation (Placement(transformation(origin={-90.4097,-26.4482}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(SampleTime(auto=false)=0 ,Instance(y(Dimension=1) ,amplitude(Dimension=1) ,bias(Dimension=1) ,frequency(Dimension=1) ,phase(Dimension=1)))));
  SysplorerEmbeddedCoder.SignalRouting.Mux mux 
    annotation (Placement(transformation(origin={-36.4337,-5.93731}, 
extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1(Type(ref="double") ,Dimension=1) ,u2(Type(ref="double") ,Dimension=1)) ,y(Type(ref="double") ,Dimension=[2])),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.SignalRouting.DeMux deMux 
    annotation (Placement(transformation(origin={46.959,-6.74696}, 
extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1(Type(ref="double") ,Dimension=1) ,y2(Type(ref="double") ,Dimension=1)) ,u(Type(ref="double") ,Dimension=[2])),SampleTime(group="D0")=0)));
  Scope y1 
    annotation (Placement(transformation(origin={90.1398,12.9542}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  Scope1 y2 
    annotation (Placement(transformation(origin={90.4241,-27.2434}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
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
  block Scope1 "显示仿真过程中生成的信号"

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

  end Scope1;
equation
  connect(sineWave.y, mux.u1) 
  annotation(Line(origin={-59,7}, 
points={{-19.6096,10.0024},{-2.53253,10.0024},{-2.53253,-7.93731},{19.5163,-7.93731}}, 
color={0,0,0}));
  connect(sineWave1.y, mux.u2) 
  annotation(Line(origin={-59,-19}, 
points={{-19.6097,-7.4482},{-2.26265,-7.4482},{-2.26265,8.06269},{19.5163,8.06269}}, 
color={0,0,0}));
  connect(mux.y, stateSpace.u) 
  annotation(Line(origin={-22,-7}, 
points={{-11.3837,1.06269},{5.07225,1.06269},{5.07225,0.792748}}, 
color={0,0,0}));
  connect(stateSpace.y, deMux.u) 
  annotation(Line(origin={35,-6}, 
points={{-9.43615,-0.20725},{8.909,-0.20725},{8.909,-0.74696}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(deMux.y1, y1.u1) 
  annotation(Line(origin={65,6}, 
points={{-14.991,-7.74696},{0.310843,-7.74696},{0.310843,6.9542},{13.3398,6.9542}}, 
color={0,0,0}));
  connect(deMux.y2, y2.u1) 
  annotation(Line(origin={66,-20}, 
points={{-15.991,8.25304},{-0.419277,8.25304},{-0.419277,-7.24339},{12.6241,-7.24339}}, 
color={0,0,0}));

end Q19;

model Q20
  extends ModelWorkspace;
  import SysplorerEmbeddedCoder.Types.*;
  import BaseWorkspace.*;
  annotation(__MWORKS(version="2025a",modelType=Control,PortArrangement,BlockSystem(blockKind=BlockKind.userModel,SampleTime(auto=true,group="")=0.6),SysblockVersion="1.0",ContinueSimConfig(SaveContinueFile="false",SaveBeforeStop="false",NumberBeforeStop=1,FixedContinueInterval="false",ContinueIntervalLength=0,ContinueTimeVector)),Icon(coordinateSystem(preserveAspectRatio=false)),experiment(Algorithm=Sdirk34,Interval=-1,InlineIntegrator=false,InlineStepSize=false,StartTime=0,StopTime=30,Tolerance=0.0001),Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, 
grid={2,2})));
  block JuliaFunction "编辑和调用Julia脚本函数"
    annotation(__MWORKS(BlockSystem(blockKind = BlockKind.composite,bltBlockKind = BltBlockKind.JuliaFunction, 
SampleTime(auto = true)),PortArrangement(Left(in_m,in_P,in_alpha,in_X,in_theta), Right(out_result)),independentInstance=true,sourceModel=SysplorerEmbeddedCoder.Utilities.JuliaFunction,hide=true), Icon(coordinateSystem(extent = {{-240, -130}, {240, 130}}, grid = {2, 2}), 
      graphics = {Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-240, 130}, {240, -130}}), Line(origin = {5, -3}, points = {{-65, -47}, {0, 65}, {65, -47},{-65, -47}}, color = {179, 179, 179}, thickness = 20), 
      Text(origin = {0, -100}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%block_textstring", fontSize = 16, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Center), 
      Text(origin = {6.217248937900877e-15, -152}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = " %name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

constant String block_textstring="dvdt";

    class JuliaFunctionExtObj
      extends ExternalObject;

      function constructor

        input SysplorerEmbeddedCoder.Types.Auto funcName 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        input SysplorerEmbeddedCoder.Types.Auto scriptText 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        output JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" obj = InitJuliaFunction(funcName, scriptText) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end constructor;

      function destructor
        input JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" ExitJuliaFunction(obj) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end destructor;

      annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
    end JuliaFunctionExtObj;



    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;


    ExternalObject_T x "外部对象构造组件" annotation(
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="dvdt",u2(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="base64=ZnVuY3Rpb24gZHZkdChtLCBQLCBhbHBoYSwgWCwgdGhldGEpCQogICAgCiAgICBnID0gOS44MQoJCiAgICByZXN1bHQgPSAoUCpjb3MoYWxwaGEpIC0gWCAtIG0qZypzaW4odGhldGEpKS9tCiAgICAKcmV0dXJuIHJlc3VsdAkJCQplbmQ="),y(Type(inherit=InheritType.none ,ref=JuliaFunctionExtObj) ,Dimension(dimensionType=DimensionType.none)=1)),SampleTime(group="D1")=0.02)));



  /**/
  CCaller c_caller 
  annotation (Placement(transformation(origin = {0, 0}, extent = {{-20, -10}, {20, 10}})),__MWORKS(BlockSystem(SampleTime(group="")=0.02)));
    SysplorerEmbeddedCoder.SignalRouting.Mux mux(portNumber=5) 
      annotation (Placement(transformation(origin={-60,0}, 
extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1,u2,u3,u4,u5)))));
    SysplorerEmbeddedCoder.SignalRouting.DeMux deMux(portNumber=1) 
      annotation (Placement(transformation(origin={60,0}, 
extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1)))));
    SysplorerEmbeddedCoder.Port.Inport in_m 
    annotation(Placement(transformation(origin = { -240,120 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,120 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_m(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,120 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_m 
annotation(Placement(transformation(origin = { -120,120 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_P 
    annotation(Placement(transformation(origin = { -240,60 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,60 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_P(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,60 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_P 
annotation(Placement(transformation(origin = { -120,60 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_alpha 
    annotation(Placement(transformation(origin = { -240,0 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,0 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_alpha(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_alpha 
annotation(Placement(transformation(origin = { -120,0 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_X 
    annotation(Placement(transformation(origin = { -240,-60 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-60 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_X(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,-60 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_X 
annotation(Placement(transformation(origin = { -120,-60 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_theta 
    annotation(Placement(transformation(origin = { -240,-120 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-120 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_theta(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,-120 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_theta 
annotation(Placement(transformation(origin = { -120,-120 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Outport out_result 
annotation(Placement(transformation(origin = { 300,0 }, 
extent = { {-6.5,-6.5},{6.5,6.5} }), 
iconTransformation(origin = { 301.8,0 }, 
extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_result(isSaturate=false) 
annotation(Placement(transformation(origin = { 240,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_result(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
annotation(Placement(transformation(origin = { 180,0 }, 
extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem0 subSystem_out_result 
annotation(Placement(transformation(origin = { 120,0 }, 
extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    block CCaller
  annotation(
  __MWORKS(PortArrangement(Left(extobj,inputdat), Right(outputdat)),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
  Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
  fillColor = {255, 255, 255}, 
  fillPattern = FillPattern.Solid, 
  extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
  extent = {{-200.0, 20.0}, {200, -20}}, 
  textString = "StepFunc_juliaobj", 
  verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
  lineColor = {0, 0, 0}, 
  extent = {{-150, 20}, {150, -20}}, 
  textString = "%name", 
  fontSize = 14, 
  textStyle = {TextStyle.None}, 
  textColor = {0, 0, 0}, 
  verticalAlignment = TextAlignment.Top) }), 
  Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
  function func_CCaller
  input SysplorerEmbeddedCoder.Types.Auto extobj annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto inputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[5])));
  input SysplorerEmbeddedCoder.Types.Auto input_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[5])));
  input SysplorerEmbeddedCoder.Types.Auto input_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[5])));

  input SysplorerEmbeddedCoder.Types.Auto input_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto input_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto output_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto output_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  output SysplorerEmbeddedCoder.Types.Auto outputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto has_input annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto has_output annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
    annotation(Protection(access=Access.packageDuplicate));
  external "C" StepJuliaFunction(extobj,inputdat,input_dims,input_types,input_count,input_dim_max,output_dims,output_types,output_count,output_dim_max,outputdat,has_input,has_output) 
  annotation (
  Library = "julia_function", 
  LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/"
  );
  end func_CCaller;
  SysplorerEmbeddedCoder.Port.Inport inputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[5])), Placement(transformation(origin = {0,-60}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Outport outputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Inport extobj 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,60}, extent = { {-10,-10}, {10,10} })));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dims={-1,-1,-1,-1,-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[5])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_types={0,0,0,0,0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[5])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_count=5 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));


  parameter SysplorerEmbeddedCoder.Types.Auto output_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto output_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  parameter SysplorerEmbeddedCoder.Types.Auto output_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto output_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto has_input=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto has_output=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  equation
  outputdat = func_CCaller(extobj, inputdat, input_dims, input_types,input_count,input_dim_max, output_dims, output_types, output_count,output_dim_max, has_input, has_output);
  end CCaller;
    block SubSystem0 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
SysplorerEmbeddedCoder.Port.Inport u 
annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
SysplorerEmbeddedCoder.Port.Outport y 
annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
equation
connect(u, y) 
annotation(Line(origin = { 50.0, 0.0 }, 
points = { {-160.0, -2.0}, {60.0, -2.0} }, 
color = { 0, 0, 0 }));
end SubSystem0;
    equation
    connect(x.y, c_caller.extobj);
    connect(in_m, typeConversion_in_m.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,120},{-180,120 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_m.y, reshape_in_m.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,120},{-120,120} }, 
color = { 0,0,0 }));
    connect(reshape_in_m.y, mux.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,120},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_P, typeConversion_in_P.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,60},{-180,60 } },                             color = { 0,0,0 }));
    connect(typeConversion_in_P.y, reshape_in_P.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,60},{-120,60} }, 
color = { 0,0,0 }));
    connect(reshape_in_P.y, mux.u2) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,60},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_alpha, typeConversion_in_alpha.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,0},{-180,0 } },                               color = { 0,0,0 }));
    connect(typeConversion_in_alpha.y, reshape_in_alpha.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,0},{-120,0} }, 
color = { 0,0,0 }));
    connect(reshape_in_alpha.y, mux.u3) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,0},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_X, typeConversion_in_X.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,-60},{-180,-60 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_X.y, reshape_in_X.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,-60},{-120,-60} }, 
color = { 0,0,0 }));
    connect(reshape_in_X.y, mux.u4) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,-60},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_theta, typeConversion_in_theta.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,-120},{-180,-120 } },                         color = { 0,0,0 }));
    connect(typeConversion_in_theta.y, reshape_in_theta.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,-120},{-120,-120} }, 
color = { 0,0,0 }));
    connect(reshape_in_theta.y, mux.u5) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,-120},{-60,0} }, 
color = { 0,0,0 }));
    connect(mux.y, c_caller.inputdat) 
annotation(Line(origin = { 0,0 }, 
points = { {-60,0},{0,0} }, 
color = { 0,0,0 }));
    connect(c_caller.outputdat, deMux.u) 
annotation(Line(origin = { 0,0 }, 
points = { {0,0},{60,0} }, 
color = { 0,0,0 }));
    connect(typeConversion_out_result.y, out_result) 
annotation(Line(origin = { 0,0 }, 
points = { {240,0},{300,0} }, 
color = { 0,0,0 }));
    connect(reshape_out_result.y, typeConversion_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {180,0},{240,0} }, 
color = { 0,0,0 }));
    connect(subSystem_out_result.y, reshape_out_result.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {120,0},{180,0} }, 
color = { 0,0,0 }));
    connect(deMux.y1, subSystem_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {60,0},{120,0} }, 
color = { 0,0,0 }));
    end JuliaFunction;
  JuliaFunction juliaFunction 
    annotation (Placement(transformation(origin={-181.554,89.0074}, 
extent={{-18.4528,-10.8868},{18.4528,10.8868}})),__MWORKS(BlockSystem(Instance(mux(u(u1(Type(ref="double") ,Dimension=[1]) ,u2(Type(ref="double") ,Dimension=[1]) ,u3(Type(ref="double") ,Dimension=[1]) ,u4(Type(ref="double") ,Dimension=[1]) ,u5(Type(ref="double") ,Dimension=[1])) ,y(Type(ref="double") ,Dimension=[5])) ,deMux(u(Type(ref="double") ,Dimension=[1]) ,y(y1(Type(ref="double") ,Dimension=[1]))) ,typeConversion_in_m(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_m(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_P(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_P(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_alpha(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_alpha(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_X(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_X(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_theta(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_theta(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_out_result(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_result(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double")))),SampleTime(group="D0")=0)));
  JuliaFunction1 juliaFunction1 
    annotation (Placement(transformation(origin={-181.736,55.4717}, 
extent={{-18.4528,-10.8868},{18.4528,10.8868}})),__MWORKS(BlockSystem(Instance(mux(u(u1(Type(ref="double") ,Dimension=[1]) ,u2(Type(ref="double") ,Dimension=[1]) ,u3(Type(ref="double") ,Dimension=[1]) ,u4(Type(ref="double") ,Dimension=[1]) ,u5(Type(ref="double") ,Dimension=[1]) ,u6(Type(ref="double") ,Dimension=[1])) ,y(Type(ref="double") ,Dimension=[6])) ,deMux(u(Type(ref="double") ,Dimension=[1]) ,y(y1(Type(ref="double") ,Dimension=[1]))) ,typeConversion_in_m(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_m(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_V(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_V(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_P(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_P(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_alpha(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_alpha(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_Y(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_Y(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_theta(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_theta(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_out_result(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_result(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double")))),SampleTime(group="D0")=0)));
  JuliaFunction2 juliaFunction2 
    annotation (Placement(transformation(origin={-183.057,21.1321}, 
extent={{-18.4528,-10.8868},{18.4528,10.8868}})),__MWORKS(BlockSystem(Instance(mux(u(u1(Type(ref="double") ,Dimension=[1]) ,u2(Type(ref="double") ,Dimension=[1])) ,y(Type(ref="double") ,Dimension=[2])) ,deMux(u(Type(ref="double") ,Dimension=[1]) ,y(y1(Type(ref="double") ,Dimension=[1]))) ,typeConversion_in_V(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_V(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_theta(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_theta(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_out_result(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_result(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double")))),SampleTime(group="D0")=0)));
  JuliaFunction3 juliaFunction3 
    annotation (Placement(transformation(origin={-183.623,-14.3019}, 
extent={{-18.4528,-10.8868},{18.4528,10.8868}})),__MWORKS(BlockSystem(Instance(mux(u(u1(Type(ref="double") ,Dimension=[1]) ,u2(Type(ref="double") ,Dimension=[1])) ,y(Type(ref="double") ,Dimension=[2])) ,deMux(u(Type(ref="double") ,Dimension=[1]) ,y(y1(Type(ref="double") ,Dimension=[1]))) ,typeConversion_in_V(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_V(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_theta(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_theta(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_out_result(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_result(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double")))),SampleTime(group="D0")=0)));
  JuliaFunction4 juliaFunction4 
    annotation (Placement(transformation(origin={-183.849,-50.1887}, 
extent={{-18.4528,-10.8868},{18.4528,10.8868}})),__MWORKS(BlockSystem(Instance(mux(u(u1(Type(ref="double") ,Dimension=[1])) ,y(Type(ref="double") ,Dimension=[1])) ,deMux(u(Type(ref="double") ,Dimension=[2]) ,y(y1(Type(ref="double") ,Dimension=[1]) ,y2(Type(ref="double") ,Dimension=[1]))) ,typeConversion_in_m(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_m(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_out_result(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_result(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double"))) ,typeConversion_out_P(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_P(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double")))),SampleTime(group="D0")=0)));
  JuliaFunction5 juliaFunction5 
    annotation (Placement(transformation(origin={-1.09421,9.47169}, 
extent={{-18.4528,-10.8868},{18.4528,10.8868}})),__MWORKS(BlockSystem(Instance(mux(u(u1(Type(ref="double") ,Dimension=[1])) ,y(Type(ref="double") ,Dimension=[1])) ,deMux(u(Type(ref="double") ,Dimension=[1]) ,y(y1(Type(ref="double") ,Dimension=[1]))) ,typeConversion_in_alpha(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_alpha(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_out_result(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_result(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double")))),SampleTime(group="D0")=0)));
  JuliaFunction7 juliaFunction7 
    annotation (Placement(transformation(origin={-1.32051,-67.3585}, 
extent={{-18.4528,-10.8868},{18.4528,10.8868}})),__MWORKS(BlockSystem(Instance(mux(u(u1(Type(ref="double") ,Dimension=[1]) ,u2(Type(ref="double") ,Dimension=[1]) ,u3(Type(ref="double") ,Dimension=[1])) ,y(Type(ref="double") ,Dimension=[3])) ,deMux(u(Type(ref="double") ,Dimension=[1]) ,y(y1(Type(ref="double") ,Dimension=[1]))) ,typeConversion_in_alpha(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_alpha(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_deltaz(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_deltaz(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_omegaz(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_omegaz(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_out_result(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_result(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double")))),SampleTime(group="D0")=0)));
  JuliaFunction6 juliaFunction6 
    annotation (Placement(transformation(origin={-1.05701,-29.3209}, 
extent={{-18.4528,-10.8868},{18.4528,10.8868}})),__MWORKS(BlockSystem(Instance(mux(u(u1(Type(ref="double") ,Dimension=[1]) ,u2(Type(ref="double") ,Dimension=[1])) ,y(Type(ref="double") ,Dimension=[2])) ,deMux(u(Type(ref="double") ,Dimension=[1]) ,y(y1(Type(ref="double") ,Dimension=[1]))) ,typeConversion_in_alpha(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_alpha(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_deltaz(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_deltaz(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_out_result(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_result(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double")))),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Continuous.Integrator integrator(initCond=m0,externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None,showSaturationPort=false) 
    annotation (Placement(transformation(origin={-139.735,-50.1887}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Dimension=1) ,y(Dimension=1) ,initCond(Dimension=1) ,absoluteTolerance(Dimension=1)),SampleTime(group="D0")=0)));
  Scope m 
    annotation (Placement(transformation(origin={-98.2641,-49.9245}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Continuous.Integrator integrator1(initCond=v0,externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None) 
    annotation (Placement(transformation(origin={-137.887,88.7547}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Dimension=1) ,y(Dimension=1) ,initCond(Dimension=1) ,absoluteTolerance(Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Continuous.Integrator integrator2(initCond=theta0,externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None) 
    annotation (Placement(transformation(origin={-137.623,55.7358}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Dimension=1) ,y(Dimension=1) ,initCond(Dimension=1) ,absoluteTolerance(Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Continuous.Integrator integrator3(initCond=x0,externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None) 
    annotation (Placement(transformation(origin={-138.415,20.6038}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Dimension=1) ,y(Dimension=1) ,initCond(Dimension=1) ,absoluteTolerance(Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Continuous.Integrator integrator4(initCond=y0,externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None,zeroCross=true,showSaturationPort=false) 
    annotation (Placement(transformation(origin={-138.68,-14.7925}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Dimension=1) ,y(Dimension=1) ,initCond(Dimension=1) ,absoluteTolerance(Dimension=1)),SampleTime(group="D0")=0,zeroCross=true)));
  Scope1 v 
    annotation (Placement(transformation(origin={-97.2452,88.9811}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.Sources.Constant alpha(k=0) 
    annotation (Placement(transformation(origin={-255.698,93.2453}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(SampleTime(auto=true,group="D0")=0,Instance(y(Type(ref="double") ,Dimension=1) ,k(Type(ref="double") ,Dimension=1)))));
  SysplorerEmbeddedCoder.Sources.Constant deltaz(k=0) 
    annotation (Placement(transformation(origin={-55.6064,-18.0988}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(SampleTime(auto=true,group="D0")=0,Instance(y(Type(ref="double") ,Dimension=1) ,k(Type(ref="double") ,Dimension=1)))));
  Scope2 theta 
    annotation (Placement(transformation(origin={-96.9433,55.7358}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  Scope3 X 
    annotation (Placement(transformation(origin={-97.7358,20.0755}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  Scope4 Y 
    annotation (Placement(transformation(origin={-97.4717,-15.0566}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  Scope5 mz 
    annotation (Placement(transformation(origin={58.4038,-67.4114}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  Scope6 Cy 
    annotation (Placement(transformation(origin={58.234,-29.8076}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  Scope7 Cx 
    annotation (Placement(transformation(origin={57.2415,8.71694}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  JuliaFunction9 juliaFunction9 
    annotation (Placement(transformation(origin={-0.750996,49.3717}, 
extent={{18.1887,-10.5302},{-18.1887,10.5302}})),__MWORKS(BlockSystem(Instance(mux(u(u1(Type(ref="double") ,Dimension=[1]) ,u2(Type(ref="double") ,Dimension=[1]) ,u3(Type(ref="double") ,Dimension=[1])) ,y(Type(ref="double") ,Dimension=[3])) ,deMux(u(Type(ref="double") ,Dimension=[1]) ,y(y1(Type(ref="double") ,Dimension=[1]))) ,typeConversion_in_Cy(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_Cy(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_rou(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_rou(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_V(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_V(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_out_result(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_result(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double")))),SampleTime(group="D0")=0)));
  JuliaFunction8 juliaFunction8 
    annotation (Placement(transformation(origin={-0.339646,89.2999}, 
extent={{18.1887,-10.5302},{-18.1887,10.5302}})),__MWORKS(BlockSystem(Instance(mux(u(u1(Type(ref="double") ,Dimension=[1]) ,u2(Type(ref="double") ,Dimension=[1]) ,u3(Type(ref="double") ,Dimension=[1])) ,y(Type(ref="double") ,Dimension=[3])) ,deMux(u(Type(ref="double") ,Dimension=[1]) ,y(y1(Type(ref="double") ,Dimension=[1]))) ,typeConversion_in_Cx(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_Cx(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_rou(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_rou(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_in_V(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_in_V(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,typeConversion_out_result(u(Type(ref="double") ,Dimension=1) ,y(Dimension=1)) ,reshape_out_result(u1(Type(ref="double") ,Dimension=[1]) ,y(Type(ref="double")))),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.LookupTable.LookupTable1D H2rou(table={1.22499915588771, 1.21328193983245, 1.20165065878509, 1.19010487507890, 1.17864415229091, 1.16726805524115, 1.15597614999197, 1.14476800384728, 1.13364318535186, 1.12260126429058, 1.11164181168774, 1.10076439980628, 1.08996860214709, 1.07925399344826, 1.06862014968436, 1.05806664806568, 1.04759306703752, 1.03719898627945, 1.02688398670456, 1.01664765045873, 1.00648956091988, 0.996409302697256, 0.986406461630637, 0.976480624789640, 0.966631380472945, 0.956858318207561, 0.947161028748069, 0.937539104075878, 0.927992137398474, 0.918519723148659, 0.909121456983814, 0.899796935785125, 0.890545757656838, 0.881367521925500, 0.872261829139196, 0.863228281066793, 0.854266480697172, 0.845376032238471, 0.836556541117316, 0.827807613978055, 0.819128858681995, 0.810519884306627, 0.801980301144856, 0.793509720704238, 0.785107755706194, 0.776774020085245, 0.768508128988230, 0.760309698773530, 0.752178347010294, 0.744113692477649, 0.736115355163928, 0.728182956265878, 0.720316118187880, 0.712514464541163, 0.704777620143011, 0.697105211015981, 0.689496864387107, 0.681952208687108, 0.674470873549595, 0.667052489810276, 0.659696689506159, 0.652403105874753, 0.645171373353265, 0.638001127577806, 0.630892005382577, 0.623843644799077, 0.616855685055285, 0.609927766574859, 0.603059530976324, 0.596250621072261, 0.589500680868495, 0.582809355563279, 0.576176291546483, 0.569601136398769, 0.563083538890775, 0.556623148982300, 0.550219617821470, 0.543872597743924, 0.537581742271981, 0.531346706113820, 0.525167145162640, 0.519042716495843, 0.512973078374188, 0.506957890240966, 0.500996812721159, 0.495089507620604, 0.489235637925154, 0.483434867799837, 0.477686862588010, 0.471991288810519, 0.466347814164849, 0.460756107524276, 0.455215838937019, 0.449726679625388, 0.444288301984927, 0.438900379583561, 0.433562587160741, 0.428274600626581, 0.423036097060998, 0.417846754712852, 0.412706252999076, 0.407614272503816, 0.402570494977558, 
0.397574603336260, 0.392626281660476, 0.387725215194490
       , 0.382871090345430, 0.378063594682397, 0.373302416935585, 0.368587246995397, 0.363917775911558, 0.358224222594028, 0.352619745852377, 0.347102952068959, 0.341672469429505, 0.336326947582005, 0.331065057300928, 0.325885490156695, 0.320786958190322, 0.315768193593155, 0.310827948391614, 0.305964994136870, 0.301178121599379, 0.296466140468190, 0.291827879054963, 0.287262184002615, 0.282767919998522, 0.278343969492214, 0.273989232417480, 0.269702625918826, 0.265483084082212, 0.261329557669994, 0.257241013860026, 0.253216435988833, 0.249254823298807, 0.245355190689357, 0.241516568471953, 0.237738002128999, 0.234018552076487, 0.230357293430352, 0.226753315776492, 0.223205722944385, 0.219713632784243, 0.216276176947655, 0.212892500671665, 0.209561762566223, 0.206283134404965, 0.203055800919262, 0.199878959595500, 0.196751820475519, 0.193673605960187, 0.190643550616036, 0.187660900984930, 0.184724915396710, 0.181834863784768, 0.178990027504510, 0.176189699154650, 0.173433182401315, 0.170719791804889, 0.168048852649570, 0.165419700775597, 0.162831682414096, 0.160284154024516, 0.157776482134601, 0.155308043182875, 0.152878223363582, 0.150486418474059, 0.148132033764491, 0.145814483790023, 0.143533192265181, 0.141287591920570, 0.139077124361819, 0.136901239930730, 0.134759397568594, 0.132651064681658, 0.130575717008684, 0.128532838490586, 0.126521921142109, 0.124542464925511, 0.122593977626220, 0.120675974730443, 0.118787979304686, 0.116929521877157, 0.115100140321026, 0.113299379739514, 0.111526792352778, 0.109781937386562, 0.108064380962596, 0.106373695990709, 0.104709462062622, 0.103071265347417, 0.101458698488623, 0.0998713605029335, 0.0983088566804879, 0.0967707984867278, 0.0952568034657811, 0.0937664951453608, 0.0922995029431504, 0.0908554620746548, 0.0894340134624921, 0.0880348036471048, 0.0866178194395534, 0.0852242804931989, 0.0838537883409368, 0.0825059514669099, 0.0811803851821223, 0.0798767115023370, 0.0785945590282124, 0.0773335628276308, 0.0760933643201901
, 0.0748736111638025, 0.0736739571433726
, 0.0724940620615118, 0.0713335916312506, 0.0701922173707107, 0.0690696164997011, 0.0679654718382039, 0.0668794717067112, 0.0658113098283813, 0.0647606852329785, 0.0637273021625621, 0.0627108699788967, 0.0617111030725462, 0.0607277207736226, 0.0597604472641601, 0.0588090114920797, 0.0578731470867211, 0.0569525922759065, 0.0560470898045113, 0.0551563868545150, 0.0542802349664982, 0.0534183899625676, 0.0525706118706757, 0.0517366648503126, 0.0509163171195443, 0.0501093408833689, 0.0493155122633736, 0.0485346112286595, 0.0477664215280187, 0.0470107306233350, 0.0462673296241877, 0.0455360132236361, 0.0448165796351642, 0.0441088305307603, 0.0434125709801158, 0.0427276093909167, 0.0420537574502130, 0.0413908300668430, 0.0407386453148933, 0.0400970243781772, 0.0394657914957098, 0.0388447739081639, 0.0382338018052885, 0.0376327082742699, 0.0370413292490217, 0.0364595034603822, 0.0358870723872068, 0.0353238802083369, 0.0347697737554277, 0.0342246024666234, 0.0336882183410590, 0.0331604758941782, 0.0326412321138494, 0.0321303464172668, 0.0316276806086212, 0.0311330988375269, 0.0306464675581908, 0.0301676554893105, 0.0296965335746877, 0.0292329749445431, 0.0287768548775214, 0.0283280507633731, 0.0278864420663006, 0.0274519102889562, 0.0270243389370825, 0.0266036134847780, 0.0261896213403842, 0.0257822518129757, 0.0253813960794464, 0.0249869471521810, 0.0245987998472978, 0.0242168507534569, 0.0238409982012203, 0.0234711422329547, 0.0231071845732683, 0.0227490285999699, 0.0223965793155428, 0.0220497433191225, 0.0217084287789708, 0.0213725454054354, 0.0210420044243875, 0.0207167185511287, 0.0203966019647580, 0.0200815702829913, 0.0197715405374249, 0.0194664311492348, 0.0191661619053040, 0.0188706539347712, 0.0185798296859907, 0.0182936129038996, 0.0180119286077806},axis1={0, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000, 2100, 2200, 2300, 2400, 2500, 2600, 2700, 2800, 2900, 3000, 3100, 3200, 3300, 3400, 3500, 3600, 
3700, 3800, 3900, 4000, 4100, 4200, 4300, 4400, 
4500,4600, 4700, 4800, 4900, 5000, 5100, 5200, 5300, 5400, 5500, 5600, 5700, 5800, 5900, 6000, 6100, 6200, 6300, 6400, 6500, 6600, 6700, 6800, 6900, 7000, 7100, 7200, 7300, 7400, 7500, 7600, 7700, 7800, 7900, 8000, 8100, 8200, 8300, 8400, 8500, 8600, 8700, 8800, 8900, 9000, 9100, 9200, 9300, 9400, 9500, 9600, 9700, 9800, 9900, 10000, 10100, 10200, 10300, 10400, 10500, 10600, 10700, 10800, 10900, 11000, 11100, 11200, 11300, 11400, 11500, 11600, 11700, 11800, 11900, 12000, 12100, 12200, 12300, 12400, 12500, 12600, 12700, 12800, 12900, 13000, 13100, 13200, 13300, 13400, 13500, 13600, 13700, 13800, 13900, 14000, 14100, 14200, 14300, 14400, 14500, 14600, 14700, 14800, 14900, 15000, 15100, 15200, 15300, 15400, 15500, 15600, 15700, 15800, 15900, 16000, 16100, 16200, 16300, 16400, 16500, 16600, 16700, 16800, 16900, 17000, 17100, 17200, 17300, 17400, 17500, 17600, 17700, 17800, 17900, 18000, 18100, 18200, 18300, 18400, 18500, 18600, 18700, 18800, 18900, 19000, 19100, 19200, 19300, 19400, 19500, 19600, 19700, 19800, 19900, 20000, 20100, 20200, 20300, 20400, 20500, 20600, 20700, 20800, 20900, 21000, 21100, 21200, 21300, 21400, 21500, 21600, 21700, 21800, 21900, 22000, 22100, 22200, 22300, 22400, 22500, 22600, 22700, 22800, 22900, 23000, 23100, 23200, 23300, 23400, 23500, 23600, 23700, 23800, 23900, 24000, 24100, 24200, 24300, 24400, 24500, 24600, 24700, 24800, 24900, 25000, 25100, 25200, 25300, 25400, 25500, 25600, 25700, 25800, 25900, 26000, 26100, 26200, 26300, 26400, 26500, 26600, 26700, 26800, 26900, 27000, 27100, 27200, 27300, 27400, 27500, 27600, 27700, 27800, 27900, 28000, 28100, 28200, 28300, 28400, 28500, 28600, 28700, 28800, 28900, 29000, 29100, 29200, 29300, 29400, 29500, 29600, 29700, 29800, 29900, 30000},tableSize=301) 
    annotation (Placement(transformation(origin={-50.717,70.7925}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u(Type(ref="double")) ,y(Type(ref="double")) ,table(Type(ref="double") ,Dimension=[301]) ,axis1(Type(ref="double") ,Dimension=[301])),SampleTime(group="D0")=0)));
  Scope8 x 
    annotation (Placement(transformation(origin={-72.1132,89.283}, 
extent={{10,-10},{-10,10}})),__MWORKS(ComponentNamePlacement(BOTTOM),BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  Scope9 rou 
    annotation (Placement(transformation(origin={-55.7358,11.0943}, 
extent={{-10,-10},{10,10}}, 
rotation=-90)),__MWORKS(ComponentNamePlacement(LEFT),BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  SysplorerEmbeddedCoder.SubSystems.If if1(zeroCross=true,showElse=false) 
    annotation (Placement(transformation(origin={-67.4987,-53.927}, 
extent={{-12.8033,-8.76282},{12.8033,8.76282}}, 
rotation=-90)),__MWORKS(BlockSystem(Instance(u(u1(Type(ref="double") ,Dimension=1)) ,y(y1)),zeroCross=true ,ifExpr(elseifExpr)=(u1 <= 0) ,SampleTime(group="D0")=0),PortLabels(labelType="CustomType",labels(label(text="u1",instance="u1"),label(text="if (u1 > 0)",instance="y1"),label(text="else",instance="y2"),label(text="if (u1 > 3000)",instance="y1"),label(text="if (u1 > 3000)",instance="y1"),label(text="if (u1 <= 0)",instance="y1"))),ComponentNamePlacement(LEFT)));
  SubSystem1 subSystem1 annotation(Placement(transformation(origin={-67.743,-85.4833}, 
extent={{-20,-10},{20,10}})),__MWORKS(ComponentNamePlacement(BOTTOM),BlockSystem(SampleTime(group="D0")=0)));
  ToFile toFile(file_name="X_data.csv",var_name="X",extract=1) 
    annotation (Placement(transformation(origin={-249.129,2.38277}, 
extent={{10,-10},{-10,10}})),__MWORKS(BlockSystem(SampleTime(group="D0")=0,Instance(reshape(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,c_caller(d(Dimension=[1])) ,inport(Dimension=1))),ComponentNamePlacement(BOTTOM)));
  ToFile1 toFile1(file_name="Y_data.csv",var_name="Y",extract=1) 
    annotation (Placement(transformation(origin={-249.659,-34.9469}, 
extent={{10,-10},{-10,10}})),__MWORKS(BlockSystem(SampleTime(group="D0")=0,Instance(reshape(u1(Type(ref="double") ,Dimension=1) ,y(Type(ref="double") ,Dimension=[1])) ,c_caller(d(Dimension=[1])) ,inport(Dimension=1))),ComponentNamePlacement(BOTTOM)));
  Scope10 P 
    annotation (Placement(transformation(origin={-249.786,-78.7159}, 
extent={{10,-10},{-10,10}})),__MWORKS(ComponentNamePlacement(BOTTOM),BlockSystem(Instance(u1(Type(ref="double") ,Dimension=1)),SampleTime(group="D0")=0)));
  block JuliaFunction1 "编辑和调用Julia脚本函数"
    annotation(__MWORKS(BlockSystem(blockKind = BlockKind.composite,bltBlockKind = BltBlockKind.JuliaFunction, 
SampleTime(auto = true)),PortArrangement(Left(in_m,in_V,in_P,in_alpha,in_Y,in_theta), Right(out_result)),independentInstance=true,sourceModel=SysplorerEmbeddedCoder.Utilities.JuliaFunction,hide=true), Icon(coordinateSystem(extent = {{-240, -130}, {240, 130}}, grid = {2, 2}), 
      graphics = {Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-240, 130}, {240, -130}}), Line(origin = {5, -3}, points = {{-65, -47}, {0, 65}, {65, -47},{-65, -47}}, color = {179, 179, 179}, thickness = 20), 
      Text(origin = {0, -100}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%block_textstring", fontSize = 16, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Center), 
      Text(origin = {6.217248937900877e-15, -152}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = " %name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

  constant String block_textstring="dthetadt";

    class JuliaFunctionExtObj
      extends ExternalObject;

      function constructor

        input SysplorerEmbeddedCoder.Types.Auto funcName 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        input SysplorerEmbeddedCoder.Types.Auto scriptText 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        output JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" obj = InitJuliaFunction(funcName, scriptText) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end constructor;

      function destructor
        input JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" ExitJuliaFunction(obj) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end destructor;

      annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
    end JuliaFunctionExtObj;



    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;


    ExternalObject_T x "外部对象构造组件" annotation(
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="dthetadt",u2(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="base64=ZnVuY3Rpb24gZHRoZXRhZHQobSwgViwgUCwgYWxwaGEsIFksIHRoZXRhKQkJCQoJCiAgICBnID0gOS44MQoKICAgIHJlc3VsdCA9IChQKnNpbihhbHBoYSkgKyBZIC0gbSpnKmNvcyh0aGV0YSkpL20vVgogICAgCnJldHVybiByZXN1bHQJCQkKZW5k"),y(Type(inherit=InheritType.none ,ref=JuliaFunctionExtObj) ,Dimension(dimensionType=DimensionType.none)=1)),SampleTime(group="D1")=0.02)));



  /**/
  CCaller c_caller 
  annotation (Placement(transformation(origin = {0, 0}, extent = {{-20, -10}, {20, 10}})),__MWORKS(BlockSystem(SampleTime(group="")=0.02)));
    SysplorerEmbeddedCoder.SignalRouting.Mux mux(portNumber=6) 
      annotation (Placement(transformation(origin={-60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1,u2,u3,u4,u5,u6)))));
    SysplorerEmbeddedCoder.SignalRouting.DeMux deMux(portNumber=1) 
      annotation (Placement(transformation(origin={60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1)))));
    SysplorerEmbeddedCoder.Port.Inport in_m 
    annotation(Placement(transformation(origin = { -240,150 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,150 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_m(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,150 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_m 
annotation(Placement(transformation(origin = { -120,150 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_V 
    annotation(Placement(transformation(origin = { -240,90 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,90 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_V(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,90 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_V 
annotation(Placement(transformation(origin = { -120,90 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_P 
    annotation(Placement(transformation(origin = { -240,30 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,30 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_P(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,30 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_P 
annotation(Placement(transformation(origin = { -120,30 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_alpha 
    annotation(Placement(transformation(origin = { -240,-30 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-30 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_alpha(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,-30 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_alpha 
annotation(Placement(transformation(origin = { -120,-30 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_Y 
    annotation(Placement(transformation(origin = { -240,-90 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-90 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_Y(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,-90 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_Y 
annotation(Placement(transformation(origin = { -120,-90 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_theta 
    annotation(Placement(transformation(origin = { -240,-150 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-150 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_theta(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,-150 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_theta 
annotation(Placement(transformation(origin = { -120,-150 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Outport out_result 
annotation(Placement(transformation(origin = { 300,0 }, 
extent = { {-6.5,-6.5},{6.5,6.5} }), 
iconTransformation(origin = { 301.8,0 }, 
extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_result(isSaturate=false) 
annotation(Placement(transformation(origin = { 240,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_result(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
annotation(Placement(transformation(origin = { 180,0 }, 
extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem0 subSystem_out_result 
annotation(Placement(transformation(origin = { 120,0 }, 
extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    block CCaller
  annotation(
  __MWORKS(PortArrangement(Left(extobj,inputdat), Right(outputdat)),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
  Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
  fillColor = {255, 255, 255}, 
  fillPattern = FillPattern.Solid, 
  extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
  extent = {{-200.0, 20.0}, {200, -20}}, 
  textString = "StepFunc_juliaobj", 
  verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
  lineColor = {0, 0, 0}, 
  extent = {{-150, 20}, {150, -20}}, 
  textString = "%name", 
  fontSize = 14, 
  textStyle = {TextStyle.None}, 
  textColor = {0, 0, 0}, 
  verticalAlignment = TextAlignment.Top) }), 
  Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
  function func_CCaller
  input SysplorerEmbeddedCoder.Types.Auto extobj annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto inputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[6])));
  input SysplorerEmbeddedCoder.Types.Auto input_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[6])));
  input SysplorerEmbeddedCoder.Types.Auto input_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[6])));

  input SysplorerEmbeddedCoder.Types.Auto input_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto input_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto output_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto output_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  output SysplorerEmbeddedCoder.Types.Auto outputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto has_input annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto has_output annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
    annotation(Protection(access=Access.packageDuplicate));
  external "C" StepJuliaFunction(extobj,inputdat,input_dims,input_types,input_count,input_dim_max,output_dims,output_types,output_count,output_dim_max,outputdat,has_input,has_output) 
  annotation (
  Library = "julia_function", 
  LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/"
  );
  end func_CCaller;
  SysplorerEmbeddedCoder.Port.Inport inputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[6])), Placement(transformation(origin = {0,-60}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Outport outputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Inport extobj 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,60}, extent = { {-10,-10}, {10,10} })));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dims={-1,-1,-1,-1,-1,-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[6])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_types={0,0,0,0,0,0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[6])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_count=6 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));


  parameter SysplorerEmbeddedCoder.Types.Auto output_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto output_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  parameter SysplorerEmbeddedCoder.Types.Auto output_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto output_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto has_input=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto has_output=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  equation
  outputdat = func_CCaller(extobj, inputdat, input_dims, input_types,input_count,input_dim_max, output_dims, output_types, output_count,output_dim_max, has_input, has_output);
  end CCaller;
    block SubSystem0 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
SysplorerEmbeddedCoder.Port.Inport u 
annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
SysplorerEmbeddedCoder.Port.Outport y 
annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
equation
connect(u, y) 
annotation(Line(origin = { 50.0, 0.0 }, 
points = { {-160.0, -2.0}, {60.0, -2.0} }, 
color = { 0, 0, 0 }));
end SubSystem0;
    equation
    connect(x.y, c_caller.extobj);
    connect(in_m, typeConversion_in_m.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,150},{-180,150 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_m.y, reshape_in_m.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,150},{-120,150} }, 
color = { 0,0,0 }));
    connect(reshape_in_m.y, mux.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,150},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_V, typeConversion_in_V.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,90},{-180,90 } },                             color = { 0,0,0 }));
    connect(typeConversion_in_V.y, reshape_in_V.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,90},{-120,90} }, 
color = { 0,0,0 }));
    connect(reshape_in_V.y, mux.u2) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,90},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_P, typeConversion_in_P.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,30},{-180,30 } },                             color = { 0,0,0 }));
    connect(typeConversion_in_P.y, reshape_in_P.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,30},{-120,30} }, 
color = { 0,0,0 }));
    connect(reshape_in_P.y, mux.u3) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,30},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_alpha, typeConversion_in_alpha.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,-30},{-180,-30 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_alpha.y, reshape_in_alpha.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,-30},{-120,-30} }, 
color = { 0,0,0 }));
    connect(reshape_in_alpha.y, mux.u4) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,-30},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_Y, typeConversion_in_Y.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,-90},{-180,-90 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_Y.y, reshape_in_Y.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,-90},{-120,-90} }, 
color = { 0,0,0 }));
    connect(reshape_in_Y.y, mux.u5) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,-90},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_theta, typeConversion_in_theta.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,-150},{-180,-150 } },                         color = { 0,0,0 }));
    connect(typeConversion_in_theta.y, reshape_in_theta.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,-150},{-120,-150} }, 
color = { 0,0,0 }));
    connect(reshape_in_theta.y, mux.u6) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,-150},{-60,0} }, 
color = { 0,0,0 }));
    connect(mux.y, c_caller.inputdat) 
annotation(Line(origin = { 0,0 }, 
points = { {-60,0},{0,0} }, 
color = { 0,0,0 }));
    connect(c_caller.outputdat, deMux.u) 
annotation(Line(origin = { 0,0 }, 
points = { {0,0},{60,0} }, 
color = { 0,0,0 }));
    connect(typeConversion_out_result.y, out_result) 
annotation(Line(origin = { 0,0 }, 
points = { {240,0},{300,0} }, 
color = { 0,0,0 }));
    connect(reshape_out_result.y, typeConversion_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {180,0},{240,0} }, 
color = { 0,0,0 }));
    connect(subSystem_out_result.y, reshape_out_result.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {120,0},{180,0} }, 
color = { 0,0,0 }));
    connect(deMux.y1, subSystem_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {60,0},{120,0} }, 
color = { 0,0,0 }));
    end JuliaFunction1;
  block JuliaFunction2 "编辑和调用Julia脚本函数"
    annotation(__MWORKS(BlockSystem(blockKind = BlockKind.composite,bltBlockKind = BltBlockKind.JuliaFunction, 
SampleTime(auto = true)),PortArrangement(Left(in_V,in_theta), Right(out_result)),independentInstance=true,sourceModel=SysplorerEmbeddedCoder.Utilities.JuliaFunction,hide=true), Icon(coordinateSystem(extent = {{-240, -130}, {240, 130}}, grid = {2, 2}), 
      graphics = {Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-240, 130}, {240, -130}}), Line(origin = {5, -3}, points = {{-65, -47}, {0, 65}, {65, -47},{-65, -47}}, color = {179, 179, 179}, thickness = 20), 
      Text(origin = {0, -100}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%block_textstring", fontSize = 16, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Center), 
      Text(origin = {6.217248937900877e-15, -152}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = " %name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

  constant String block_textstring="dxdt";

    class JuliaFunctionExtObj
      extends ExternalObject;

      function constructor

        input SysplorerEmbeddedCoder.Types.Auto funcName 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        input SysplorerEmbeddedCoder.Types.Auto scriptText 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        output JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" obj = InitJuliaFunction(funcName, scriptText) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end constructor;

      function destructor
        input JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" ExitJuliaFunction(obj) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end destructor;

      annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
    end JuliaFunctionExtObj;



    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;


    ExternalObject_T x "外部对象构造组件" annotation(
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="dxdt",u2(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="base64=ZnVuY3Rpb24gZHhkdChWLCB0aGV0YSkJCQkKCQogICAgcmVzdWx0ID0gVipjb3ModGhldGEpCiAgICAKcmV0dXJuIHJlc3VsdAkJCQplbmQ="),y(Type(inherit=InheritType.none ,ref=JuliaFunctionExtObj) ,Dimension(dimensionType=DimensionType.none)=1)),SampleTime(group="D1")=0.02)));



  /**/
  CCaller c_caller 
  annotation (Placement(transformation(origin = {0, 0}, extent = {{-20, -10}, {20, 10}})),__MWORKS(BlockSystem(SampleTime(group="")=0.02)));
    SysplorerEmbeddedCoder.SignalRouting.Mux mux(portNumber=2) 
      annotation (Placement(transformation(origin={-60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1,u2)))));
    SysplorerEmbeddedCoder.SignalRouting.DeMux deMux(portNumber=1) 
      annotation (Placement(transformation(origin={60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1)))));
    SysplorerEmbeddedCoder.Port.Inport in_V 
    annotation(Placement(transformation(origin = { -240,30 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,30 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_V(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,30 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_V 
annotation(Placement(transformation(origin = { -120,30 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_theta 
    annotation(Placement(transformation(origin = { -240,-30 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-30 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_theta(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,-30 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_theta 
annotation(Placement(transformation(origin = { -120,-30 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Outport out_result 
annotation(Placement(transformation(origin = { 300,0 }, 
extent = { {-6.5,-6.5},{6.5,6.5} }), 
iconTransformation(origin = { 301.8,0 }, 
extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_result(isSaturate=false) 
annotation(Placement(transformation(origin = { 240,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_result(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
annotation(Placement(transformation(origin = { 180,0 }, 
extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem0 subSystem_out_result 
annotation(Placement(transformation(origin = { 120,0 }, 
extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    block CCaller
  annotation(
  __MWORKS(PortArrangement(Left(extobj,inputdat), Right(outputdat)),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
  Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
  fillColor = {255, 255, 255}, 
  fillPattern = FillPattern.Solid, 
  extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
  extent = {{-200.0, 20.0}, {200, -20}}, 
  textString = "StepFunc_juliaobj", 
  verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
  lineColor = {0, 0, 0}, 
  extent = {{-150, 20}, {150, -20}}, 
  textString = "%name", 
  fontSize = 14, 
  textStyle = {TextStyle.None}, 
  textColor = {0, 0, 0}, 
  verticalAlignment = TextAlignment.Top) }), 
  Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
  function func_CCaller
  input SysplorerEmbeddedCoder.Types.Auto extobj annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto inputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[2])));
  input SysplorerEmbeddedCoder.Types.Auto input_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));
  input SysplorerEmbeddedCoder.Types.Auto input_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));

  input SysplorerEmbeddedCoder.Types.Auto input_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto input_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto output_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto output_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  output SysplorerEmbeddedCoder.Types.Auto outputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto has_input annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto has_output annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
    annotation(Protection(access=Access.packageDuplicate));
  external "C" StepJuliaFunction(extobj,inputdat,input_dims,input_types,input_count,input_dim_max,output_dims,output_types,output_count,output_dim_max,outputdat,has_input,has_output) 
  annotation (
  Library = "julia_function", 
  LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/"
  );
  end func_CCaller;
  SysplorerEmbeddedCoder.Port.Inport inputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[2])), Placement(transformation(origin = {0,-60}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Outport outputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Inport extobj 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,60}, extent = { {-10,-10}, {10,10} })));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dims={-1,-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_types={0,0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_count=2 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));


  parameter SysplorerEmbeddedCoder.Types.Auto output_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto output_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  parameter SysplorerEmbeddedCoder.Types.Auto output_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto output_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto has_input=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto has_output=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  equation
  outputdat = func_CCaller(extobj, inputdat, input_dims, input_types,input_count,input_dim_max, output_dims, output_types, output_count,output_dim_max, has_input, has_output);
  end CCaller;
    block SubSystem0 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
SysplorerEmbeddedCoder.Port.Inport u 
annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
SysplorerEmbeddedCoder.Port.Outport y 
annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
equation
connect(u, y) 
annotation(Line(origin = { 50.0, 0.0 }, 
points = { {-160.0, -2.0}, {60.0, -2.0} }, 
color = { 0, 0, 0 }));
end SubSystem0;
    equation
    connect(x.y, c_caller.extobj);
    connect(in_V, typeConversion_in_V.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,30},{-180,30 } },                             color = { 0,0,0 }));
    connect(typeConversion_in_V.y, reshape_in_V.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,30},{-120,30} }, 
color = { 0,0,0 }));
    connect(reshape_in_V.y, mux.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,30},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_theta, typeConversion_in_theta.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,-30},{-180,-30 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_theta.y, reshape_in_theta.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,-30},{-120,-30} }, 
color = { 0,0,0 }));
    connect(reshape_in_theta.y, mux.u2) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,-30},{-60,0} }, 
color = { 0,0,0 }));
    connect(mux.y, c_caller.inputdat) 
annotation(Line(origin = { 0,0 }, 
points = { {-60,0},{0,0} }, 
color = { 0,0,0 }));
    connect(c_caller.outputdat, deMux.u) 
annotation(Line(origin = { 0,0 }, 
points = { {0,0},{60,0} }, 
color = { 0,0,0 }));
    connect(typeConversion_out_result.y, out_result) 
annotation(Line(origin = { 0,0 }, 
points = { {240,0},{300,0} }, 
color = { 0,0,0 }));
    connect(reshape_out_result.y, typeConversion_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {180,0},{240,0} }, 
color = { 0,0,0 }));
    connect(subSystem_out_result.y, reshape_out_result.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {120,0},{180,0} }, 
color = { 0,0,0 }));
    connect(deMux.y1, subSystem_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {60,0},{120,0} }, 
color = { 0,0,0 }));
    end JuliaFunction2;
  block JuliaFunction3 "编辑和调用Julia脚本函数"
    annotation(__MWORKS(BlockSystem(blockKind = BlockKind.composite,bltBlockKind = BltBlockKind.JuliaFunction, 
SampleTime(auto = true)),PortArrangement(Left(in_V,in_theta), Right(out_result)),independentInstance=true,sourceModel=SysplorerEmbeddedCoder.Utilities.JuliaFunction,hide=true), Icon(coordinateSystem(extent = {{-240, -130}, {240, 130}}, grid = {2, 2}), 
      graphics = {Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-240, 130}, {240, -130}}), Line(origin = {5, -3}, points = {{-65, -47}, {0, 65}, {65, -47},{-65, -47}}, color = {179, 179, 179}, thickness = 20), 
      Text(origin = {0, -100}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%block_textstring", fontSize = 16, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Center), 
      Text(origin = {6.217248937900877e-15, -152}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = " %name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

  constant String block_textstring="dydt";

    class JuliaFunctionExtObj
      extends ExternalObject;

      function constructor

        input SysplorerEmbeddedCoder.Types.Auto funcName 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        input SysplorerEmbeddedCoder.Types.Auto scriptText 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        output JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" obj = InitJuliaFunction(funcName, scriptText) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end constructor;

      function destructor
        input JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" ExitJuliaFunction(obj) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end destructor;

      annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
    end JuliaFunctionExtObj;



    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;


    ExternalObject_T x "外部对象构造组件" annotation(
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="dydt",u2(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="base64=ZnVuY3Rpb24gZHlkdChWLCB0aGV0YSkJCQkKCQogICAgcmVzdWx0ID0gVipzaW4odGhldGEpCiAgICAKcmV0dXJuIHJlc3VsdAkJCQplbmQ="),y(Type(inherit=InheritType.none ,ref=JuliaFunctionExtObj) ,Dimension(dimensionType=DimensionType.none)=1)),SampleTime(group="D1")=0.02)));



  /**/
  CCaller c_caller 
  annotation (Placement(transformation(origin = {0, 0}, extent = {{-20, -10}, {20, 10}})),__MWORKS(BlockSystem(SampleTime(group="")=0.02)));
    SysplorerEmbeddedCoder.SignalRouting.Mux mux(portNumber=2) 
      annotation (Placement(transformation(origin={-60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1,u2)))));
    SysplorerEmbeddedCoder.SignalRouting.DeMux deMux(portNumber=1) 
      annotation (Placement(transformation(origin={60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1)))));
    SysplorerEmbeddedCoder.Port.Inport in_V 
    annotation(Placement(transformation(origin = { -240,30 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,30 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_V(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,30 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_V 
annotation(Placement(transformation(origin = { -120,30 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_theta 
    annotation(Placement(transformation(origin = { -240,-30 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-30 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_theta(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,-30 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_theta 
annotation(Placement(transformation(origin = { -120,-30 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Outport out_result 
annotation(Placement(transformation(origin = { 300,0 }, 
extent = { {-6.5,-6.5},{6.5,6.5} }), 
iconTransformation(origin = { 301.8,0 }, 
extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_result(isSaturate=false) 
annotation(Placement(transformation(origin = { 240,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_result(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
annotation(Placement(transformation(origin = { 180,0 }, 
extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem0 subSystem_out_result 
annotation(Placement(transformation(origin = { 120,0 }, 
extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    block CCaller
  annotation(
  __MWORKS(PortArrangement(Left(extobj,inputdat), Right(outputdat)),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
  Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
  fillColor = {255, 255, 255}, 
  fillPattern = FillPattern.Solid, 
  extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
  extent = {{-200.0, 20.0}, {200, -20}}, 
  textString = "StepFunc_juliaobj", 
  verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
  lineColor = {0, 0, 0}, 
  extent = {{-150, 20}, {150, -20}}, 
  textString = "%name", 
  fontSize = 14, 
  textStyle = {TextStyle.None}, 
  textColor = {0, 0, 0}, 
  verticalAlignment = TextAlignment.Top) }), 
  Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
  function func_CCaller
  input SysplorerEmbeddedCoder.Types.Auto extobj annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto inputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[2])));
  input SysplorerEmbeddedCoder.Types.Auto input_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));
  input SysplorerEmbeddedCoder.Types.Auto input_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));

  input SysplorerEmbeddedCoder.Types.Auto input_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto input_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto output_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto output_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  output SysplorerEmbeddedCoder.Types.Auto outputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto has_input annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto has_output annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
    annotation(Protection(access=Access.packageDuplicate));
  external "C" StepJuliaFunction(extobj,inputdat,input_dims,input_types,input_count,input_dim_max,output_dims,output_types,output_count,output_dim_max,outputdat,has_input,has_output) 
  annotation (
  Library = "julia_function", 
  LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/"
  );
  end func_CCaller;
  SysplorerEmbeddedCoder.Port.Inport inputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[2])), Placement(transformation(origin = {0,-60}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Outport outputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Inport extobj 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,60}, extent = { {-10,-10}, {10,10} })));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dims={-1,-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_types={0,0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_count=2 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));


  parameter SysplorerEmbeddedCoder.Types.Auto output_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto output_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  parameter SysplorerEmbeddedCoder.Types.Auto output_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto output_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto has_input=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto has_output=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  equation
  outputdat = func_CCaller(extobj, inputdat, input_dims, input_types,input_count,input_dim_max, output_dims, output_types, output_count,output_dim_max, has_input, has_output);
  end CCaller;
    block SubSystem0 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
SysplorerEmbeddedCoder.Port.Inport u 
annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
SysplorerEmbeddedCoder.Port.Outport y 
annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
equation
connect(u, y) 
annotation(Line(origin = { 50.0, 0.0 }, 
points = { {-160.0, -2.0}, {60.0, -2.0} }, 
color = { 0, 0, 0 }));
end SubSystem0;
    equation
    connect(x.y, c_caller.extobj);
    connect(in_V, typeConversion_in_V.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,30},{-180,30 } },                             color = { 0,0,0 }));
    connect(typeConversion_in_V.y, reshape_in_V.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,30},{-120,30} }, 
color = { 0,0,0 }));
    connect(reshape_in_V.y, mux.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,30},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_theta, typeConversion_in_theta.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,-30},{-180,-30 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_theta.y, reshape_in_theta.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,-30},{-120,-30} }, 
color = { 0,0,0 }));
    connect(reshape_in_theta.y, mux.u2) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,-30},{-60,0} }, 
color = { 0,0,0 }));
    connect(mux.y, c_caller.inputdat) 
annotation(Line(origin = { 0,0 }, 
points = { {-60,0},{0,0} }, 
color = { 0,0,0 }));
    connect(c_caller.outputdat, deMux.u) 
annotation(Line(origin = { 0,0 }, 
points = { {0,0},{60,0} }, 
color = { 0,0,0 }));
    connect(typeConversion_out_result.y, out_result) 
annotation(Line(origin = { 0,0 }, 
points = { {240,0},{300,0} }, 
color = { 0,0,0 }));
    connect(reshape_out_result.y, typeConversion_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {180,0},{240,0} }, 
color = { 0,0,0 }));
    connect(subSystem_out_result.y, reshape_out_result.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {120,0},{180,0} }, 
color = { 0,0,0 }));
    connect(deMux.y1, subSystem_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {60,0},{120,0} }, 
color = { 0,0,0 }));
    end JuliaFunction3;
  block JuliaFunction4 "编辑和调用Julia脚本函数"
    annotation(__MWORKS(BlockSystem(blockKind = BlockKind.composite,bltBlockKind = BltBlockKind.JuliaFunction, 
SampleTime(auto = true)),PortArrangement(Left(in_m), Right(out_result,out_P)),independentInstance=true,sourceModel=SysplorerEmbeddedCoder.Utilities.JuliaFunction,hide=true), Icon(coordinateSystem(extent = {{-240, -130}, {240, 130}}, grid = {2, 2}), 
      graphics = {Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-240, 130}, {240, -130}}), Line(origin = {5, -3}, points = {{-65, -47}, {0, 65}, {65, -47},{-65, -47}}, color = {179, 179, 179}, thickness = 20), 
      Text(origin = {0, -100}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%block_textstring", fontSize = 16, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Center), 
      Text(origin = {6.217248937900877e-15, -152}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = " %name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

  constant String block_textstring="dmdt";

    class JuliaFunctionExtObj
      extends ExternalObject;

      function constructor

        input SysplorerEmbeddedCoder.Types.Auto funcName 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        input SysplorerEmbeddedCoder.Types.Auto scriptText 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        output JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" obj = InitJuliaFunction(funcName, scriptText) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end constructor;

      function destructor
        input JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" ExitJuliaFunction(obj) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end destructor;

      annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
    end JuliaFunctionExtObj;



    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;


    ExternalObject_T x "外部对象构造组件" annotation(
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="dmdt",u2(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="base64=ZnVuY3Rpb24gZG1kdChtKQkJCQoJRiA9IDc0NQogICAgSXogPSAyOTgwCiAgICBtMCA9IDQ1CiAgICBtX2Z1ZWwgPSA1CgogICAgaWYgbSA8PSAobTAgLSBtX2Z1ZWwpCiAgICAgICAgcmVzdWx0ID0gMAogICAgICAgIFAgPSAwCiAgICAgICAgcmV0dXJuIHJlc3VsdCwgUAogICAgZW5kCgogICAgdl9tID0gRi9JegogICAgcmVzdWx0ID0gLXZfbQogICAgUCA9IEYKICAgIApyZXR1cm4gcmVzdWx0LCBQCQkKZW5k"),y(Type(inherit=InheritType.none ,ref=JuliaFunctionExtObj) ,Dimension(dimensionType=DimensionType.none)=1)),SampleTime(group="D1")=0.02)));



  /**/
  CCaller c_caller 
  annotation (Placement(transformation(origin = {0, 0}, extent = {{-20, -10}, {20, 10}})),__MWORKS(BlockSystem(SampleTime(group="")=0.02)));
    SysplorerEmbeddedCoder.SignalRouting.Mux mux(portNumber=1) 
      annotation (Placement(transformation(origin={-60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1)))));
    SysplorerEmbeddedCoder.SignalRouting.DeMux deMux(portNumber=2) 
      annotation (Placement(transformation(origin={60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1,y2)))));
    SysplorerEmbeddedCoder.Port.Inport in_m 
    annotation(Placement(transformation(origin = { -240,0 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,0 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_m(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_m 
annotation(Placement(transformation(origin = { -120,0 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Outport out_result 
annotation(Placement(transformation(origin = { 300,30 }, 
extent = { {-6.5,-6.5},{6.5,6.5} }), 
iconTransformation(origin = { 301.8,30 }, 
extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_result(isSaturate=false) 
annotation(Placement(transformation(origin = { 240,30 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_result(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
annotation(Placement(transformation(origin = { 180,30 }, 
extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem0 subSystem_out_result 
annotation(Placement(transformation(origin = { 120,30 }, 
extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    SysplorerEmbeddedCoder.Port.Outport out_P 
annotation(Placement(transformation(origin = { 300,-30 }, 
extent = { {-6.5,-6.5},{6.5,6.5} }), 
iconTransformation(origin = { 301.8,-30 }, 
extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_P(isSaturate=false) 
annotation(Placement(transformation(origin = { 240,-30 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_P(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
annotation(Placement(transformation(origin = { 180,-30 }, 
extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem1 subSystem_out_P 
annotation(Placement(transformation(origin = { 120,-30 }, 
extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    block CCaller
  annotation(
  __MWORKS(PortArrangement(Left(extobj,inputdat), Right(outputdat)),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
  Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
  fillColor = {255, 255, 255}, 
  fillPattern = FillPattern.Solid, 
  extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
  extent = {{-200.0, 20.0}, {200, -20}}, 
  textString = "StepFunc_juliaobj", 
  verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
  lineColor = {0, 0, 0}, 
  extent = {{-150, 20}, {150, -20}}, 
  textString = "%name", 
  fontSize = 14, 
  textStyle = {TextStyle.None}, 
  textColor = {0, 0, 0}, 
  verticalAlignment = TextAlignment.Top) }), 
  Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
  function func_CCaller
  input SysplorerEmbeddedCoder.Types.Auto extobj annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto inputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto input_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto input_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  input SysplorerEmbeddedCoder.Types.Auto input_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto input_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto output_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));
  input SysplorerEmbeddedCoder.Types.Auto output_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));
  input SysplorerEmbeddedCoder.Types.Auto output_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto output_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  output SysplorerEmbeddedCoder.Types.Auto outputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[2])));
  input SysplorerEmbeddedCoder.Types.Auto has_input annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto has_output annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
    annotation(Protection(access=Access.packageDuplicate));
  external "C" StepJuliaFunction(extobj,inputdat,input_dims,input_types,input_count,input_dim_max,output_dims,output_types,output_count,output_dim_max,outputdat,has_input,has_output) 
  annotation (
  Library = "julia_function", 
  LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/"
  );
  end func_CCaller;
  SysplorerEmbeddedCoder.Port.Inport inputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,-60}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Outport outputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[2])), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Inport extobj 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,60}, extent = { {-10,-10}, {10,10} })));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));


  parameter SysplorerEmbeddedCoder.Types.Auto output_dims={-1,-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));

  parameter SysplorerEmbeddedCoder.Types.Auto output_types={0,0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));
  parameter SysplorerEmbeddedCoder.Types.Auto output_count=2 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto output_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto has_input=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto has_output=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  equation
  outputdat = func_CCaller(extobj, inputdat, input_dims, input_types,input_count,input_dim_max, output_dims, output_types, output_count,output_dim_max, has_input, has_output);
  end CCaller;
    block SubSystem0 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
SysplorerEmbeddedCoder.Port.Inport u 
annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
SysplorerEmbeddedCoder.Port.Outport y 
annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
equation
connect(u, y) 
annotation(Line(origin = { 50.0, 0.0 }, 
points = { {-160.0, -2.0}, {60.0, -2.0} }, 
color = { 0, 0, 0 }));
end SubSystem0;
    block SubSystem1 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
SysplorerEmbeddedCoder.Port.Inport u 
annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
SysplorerEmbeddedCoder.Port.Outport y 
annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
equation
connect(u, y) 
annotation(Line(origin = { 50.0, 0.0 }, 
points = { {-160.0, -2.0}, {60.0, -2.0} }, 
color = { 0, 0, 0 }));
end SubSystem1;
    equation
    connect(x.y, c_caller.extobj);
    connect(in_m, typeConversion_in_m.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,0},{-180,0 } },                               color = { 0,0,0 }));
    connect(typeConversion_in_m.y, reshape_in_m.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,0},{-120,0} }, 
color = { 0,0,0 }));
    connect(reshape_in_m.y, mux.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,0},{-60,0} }, 
color = { 0,0,0 }));
    connect(mux.y, c_caller.inputdat) 
annotation(Line(origin = { 0,0 }, 
points = { {-60,0},{0,0} }, 
color = { 0,0,0 }));
    connect(c_caller.outputdat, deMux.u) 
annotation(Line(origin = { 0,0 }, 
points = { {0,0},{60,0} }, 
color = { 0,0,0 }));
    connect(typeConversion_out_result.y, out_result) 
annotation(Line(origin = { 0,0 }, 
points = { {240,30},{300,30} }, 
color = { 0,0,0 }));
    connect(reshape_out_result.y, typeConversion_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {180,30},{240,30} }, 
color = { 0,0,0 }));
    connect(subSystem_out_result.y, reshape_out_result.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {120,30},{180,30} }, 
color = { 0,0,0 }));
    connect(deMux.y1, subSystem_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {60,0},{120,30} }, 
color = { 0,0,0 }));
    connect(typeConversion_out_P.y, out_P) 
annotation(Line(origin = { 0,0 }, 
points = { {240,-30},{300,-30} }, 
color = { 0,0,0 }));
    connect(reshape_out_P.y, typeConversion_out_P.u) 
annotation(Line(origin = { 0,0 }, 
points = { {180,-30},{240,-30} }, 
color = { 0,0,0 }));
    connect(subSystem_out_P.y, reshape_out_P.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {120,-30},{180,-30} }, 
color = { 0,0,0 }));
    connect(deMux.y2, subSystem_out_P.u) 
annotation(Line(origin = { 0,0 }, 
points = { {60,0},{120,-30} }, 
color = { 0,0,0 }));
    end JuliaFunction4;
  block JuliaFunction5 "编辑和调用Julia脚本函数"
    annotation(__MWORKS(BlockSystem(blockKind = BlockKind.composite,bltBlockKind = BltBlockKind.JuliaFunction, 
SampleTime(auto = true)),PortArrangement(Left(in_alpha), Right(out_result)),independentInstance=true,sourceModel=SysplorerEmbeddedCoder.Utilities.JuliaFunction,hide=true), Icon(coordinateSystem(extent = {{-240, -130}, {240, 130}}, grid = {2, 2}), 
      graphics = {Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-240, 130}, {240, -130}}), Line(origin = {5, -3}, points = {{-65, -47}, {0, 65}, {65, -47},{-65, -47}}, color = {179, 179, 179}, thickness = 20), 
      Text(origin = {0, -100}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%block_textstring", fontSize = 16, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Center), 
      Text(origin = {6.217248937900877e-15, -152}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = " %name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

  constant String block_textstring="Cx";

    class JuliaFunctionExtObj
      extends ExternalObject;

      function constructor

        input SysplorerEmbeddedCoder.Types.Auto funcName 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        input SysplorerEmbeddedCoder.Types.Auto scriptText 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        output JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" obj = InitJuliaFunction(funcName, scriptText) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end constructor;

      function destructor
        input JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" ExitJuliaFunction(obj) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end destructor;

      annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
    end JuliaFunctionExtObj;



    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;


    ExternalObject_T x "外部对象构造组件" annotation(
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="Cx",u2(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="base64=ZnVuY3Rpb24gQ3goYWxwaGEpCQkJCgkKICAgIEN4MCA9IDAuNDQKICAgIEN4MmFscGhhMiA9IDAuMDA0NDg5OAogICAgYWxwaGEgPSByYWQyZGVnKGFscGhhKQoKICAgIHJlc3VsdCA9IEN4MCArIEN4MmFscGhhMiooYWxwaGFeMikKICAgIApyZXR1cm4gcmVzdWx0CQkJCmVuZA=="),y(Type(inherit=InheritType.none ,ref=JuliaFunctionExtObj) ,Dimension(dimensionType=DimensionType.none)=1)),SampleTime(group="D1")=0.02)));



  /**/
  CCaller c_caller 
  annotation (Placement(transformation(origin = {0, 0}, extent = {{-20, -10}, {20, 10}})),__MWORKS(BlockSystem(SampleTime(group="")=0.02)));
    SysplorerEmbeddedCoder.SignalRouting.Mux mux(portNumber=1) 
      annotation (Placement(transformation(origin={-60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1)))));
    SysplorerEmbeddedCoder.SignalRouting.DeMux deMux(portNumber=1) 
      annotation (Placement(transformation(origin={60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1)))));
    SysplorerEmbeddedCoder.Port.Inport in_alpha 
    annotation(Placement(transformation(origin = { -240,0 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,0 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_alpha(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_alpha 
annotation(Placement(transformation(origin = { -120,0 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Outport out_result 
annotation(Placement(transformation(origin = { 300,0 }, 
extent = { {-6.5,-6.5},{6.5,6.5} }), 
iconTransformation(origin = { 301.8,0 }, 
extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_result(isSaturate=false) 
annotation(Placement(transformation(origin = { 240,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_result(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
annotation(Placement(transformation(origin = { 180,0 }, 
extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem0 subSystem_out_result 
annotation(Placement(transformation(origin = { 120,0 }, 
extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    block CCaller
  annotation(
  __MWORKS(PortArrangement(Left(extobj,inputdat), Right(outputdat)),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
  Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
  fillColor = {255, 255, 255}, 
  fillPattern = FillPattern.Solid, 
  extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
  extent = {{-200.0, 20.0}, {200, -20}}, 
  textString = "StepFunc_juliaobj", 
  verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
  lineColor = {0, 0, 0}, 
  extent = {{-150, 20}, {150, -20}}, 
  textString = "%name", 
  fontSize = 14, 
  textStyle = {TextStyle.None}, 
  textColor = {0, 0, 0}, 
  verticalAlignment = TextAlignment.Top) }), 
  Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
  function func_CCaller
  input SysplorerEmbeddedCoder.Types.Auto extobj annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto inputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto input_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto input_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  input SysplorerEmbeddedCoder.Types.Auto input_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto input_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto output_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto output_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  output SysplorerEmbeddedCoder.Types.Auto outputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto has_input annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto has_output annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
    annotation(Protection(access=Access.packageDuplicate));
  external "C" StepJuliaFunction(extobj,inputdat,input_dims,input_types,input_count,input_dim_max,output_dims,output_types,output_count,output_dim_max,outputdat,has_input,has_output) 
  annotation (
  Library = "julia_function", 
  LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/"
  );
  end func_CCaller;
  SysplorerEmbeddedCoder.Port.Inport inputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,-60}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Outport outputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Inport extobj 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,60}, extent = { {-10,-10}, {10,10} })));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));


  parameter SysplorerEmbeddedCoder.Types.Auto output_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto output_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  parameter SysplorerEmbeddedCoder.Types.Auto output_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto output_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto has_input=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto has_output=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  equation
  outputdat = func_CCaller(extobj, inputdat, input_dims, input_types,input_count,input_dim_max, output_dims, output_types, output_count,output_dim_max, has_input, has_output);
  end CCaller;
    block SubSystem0 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
SysplorerEmbeddedCoder.Port.Inport u 
annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
SysplorerEmbeddedCoder.Port.Outport y 
annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
equation
connect(u, y) 
annotation(Line(origin = { 50.0, 0.0 }, 
points = { {-160.0, -2.0}, {60.0, -2.0} }, 
color = { 0, 0, 0 }));
end SubSystem0;
    equation
    connect(x.y, c_caller.extobj);
    connect(in_alpha, typeConversion_in_alpha.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,0},{-180,0 } },                               color = { 0,0,0 }));
    connect(typeConversion_in_alpha.y, reshape_in_alpha.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,0},{-120,0} }, 
color = { 0,0,0 }));
    connect(reshape_in_alpha.y, mux.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,0},{-60,0} }, 
color = { 0,0,0 }));
    connect(mux.y, c_caller.inputdat) 
annotation(Line(origin = { 0,0 }, 
points = { {-60,0},{0,0} }, 
color = { 0,0,0 }));
    connect(c_caller.outputdat, deMux.u) 
annotation(Line(origin = { 0,0 }, 
points = { {0,0},{60,0} }, 
color = { 0,0,0 }));
    connect(typeConversion_out_result.y, out_result) 
annotation(Line(origin = { 0,0 }, 
points = { {240,0},{300,0} }, 
color = { 0,0,0 }));
    connect(reshape_out_result.y, typeConversion_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {180,0},{240,0} }, 
color = { 0,0,0 }));
    connect(subSystem_out_result.y, reshape_out_result.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {120,0},{180,0} }, 
color = { 0,0,0 }));
    connect(deMux.y1, subSystem_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {60,0},{120,0} }, 
color = { 0,0,0 }));
    end JuliaFunction5;
  block JuliaFunction7 "编辑和调用Julia脚本函数"
    annotation(__MWORKS(BlockSystem(blockKind = BlockKind.composite,bltBlockKind = BltBlockKind.JuliaFunction, 
SampleTime(auto = true)),PortArrangement(Left(in_alpha,in_deltaz,in_omegaz), Right(out_result)),independentInstance=true,sourceModel=SysplorerEmbeddedCoder.Utilities.JuliaFunction,hide=true), Icon(coordinateSystem(extent = {{-240, -130}, {240, 130}}, grid = {2, 2}), 
      graphics = {Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-240, 130}, {240, -130}}), Line(origin = {5, -3}, points = {{-65, -47}, {0, 65}, {65, -47},{-65, -47}}, color = {179, 179, 179}, thickness = 20), 
      Text(origin = {0, -100}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%block_textstring", fontSize = 16, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Center), 
      Text(origin = {6.217248937900877e-15, -152}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = " %name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

  constant String block_textstring="mz";

    class JuliaFunctionExtObj
      extends ExternalObject;

      function constructor

        input SysplorerEmbeddedCoder.Types.Auto funcName 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        input SysplorerEmbeddedCoder.Types.Auto scriptText 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        output JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" obj = InitJuliaFunction(funcName, scriptText) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end constructor;

      function destructor
        input JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" ExitJuliaFunction(obj) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end destructor;

      annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
    end JuliaFunctionExtObj;



    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;


    ExternalObject_T x "外部对象构造组件" annotation(
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="mz",u2(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="base64=ZnVuY3Rpb24gbXooYWxwaGEsIGRlbHRheiwgb21lZ2F6KQkJCQoJCiAgICBtejJhbHBoYSA9IC0wLjE5ODU3CiAgICBtejJkZWx0YXogPSAtMC40CiAgICBtejJvbWVnYXogPSAtNDYuMwogICAgYWxwaGEgPSByYWQyZGVnKGFscGhhKQogICAgZGVsdGF6ID0gcmFkMmRlZyhkZWx0YXopCiAgICBvbWVnYXogPSByYWQyZGVnKG9tZWdheikKCiAgICByZXN1bHQgPSBtejJhbHBoYSphbHBoYSArIG16MmRlbHRheipkZWx0YXogK216Mm9tZWdhKm9tZWdhCiAgICAKcmV0dXJuIHJlc3VsdAkJCQplbmQ="),y(Type(inherit=InheritType.none ,ref=JuliaFunctionExtObj) ,Dimension(dimensionType=DimensionType.none)=1)),SampleTime(group="D1")=0.02)));



  /**/
  CCaller c_caller 
  annotation (Placement(transformation(origin = {0, 0}, extent = {{-20, -10}, {20, 10}})),__MWORKS(BlockSystem(SampleTime(group="")=0.02)));
    SysplorerEmbeddedCoder.SignalRouting.Mux mux(portNumber=3) 
      annotation (Placement(transformation(origin={-60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1,u2,u3)))));
    SysplorerEmbeddedCoder.SignalRouting.DeMux deMux(portNumber=1) 
      annotation (Placement(transformation(origin={60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1)))));
    SysplorerEmbeddedCoder.Port.Inport in_alpha 
    annotation(Placement(transformation(origin = { -240,60 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,60 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_alpha(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,60 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_alpha 
annotation(Placement(transformation(origin = { -120,60 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_deltaz 
    annotation(Placement(transformation(origin = { -240,0 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,0 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_deltaz(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_deltaz 
annotation(Placement(transformation(origin = { -120,0 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_omegaz 
    annotation(Placement(transformation(origin = { -240,-60 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-60 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_omegaz(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,-60 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_omegaz 
annotation(Placement(transformation(origin = { -120,-60 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Outport out_result 
annotation(Placement(transformation(origin = { 300,0 }, 
extent = { {-6.5,-6.5},{6.5,6.5} }), 
iconTransformation(origin = { 301.8,0 }, 
extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_result(isSaturate=false) 
annotation(Placement(transformation(origin = { 240,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_result(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
annotation(Placement(transformation(origin = { 180,0 }, 
extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem0 subSystem_out_result 
annotation(Placement(transformation(origin = { 120,0 }, 
extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    block CCaller
  annotation(
  __MWORKS(PortArrangement(Left(extobj,inputdat), Right(outputdat)),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
  Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
  fillColor = {255, 255, 255}, 
  fillPattern = FillPattern.Solid, 
  extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
  extent = {{-200.0, 20.0}, {200, -20}}, 
  textString = "StepFunc_juliaobj", 
  verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
  lineColor = {0, 0, 0}, 
  extent = {{-150, 20}, {150, -20}}, 
  textString = "%name", 
  fontSize = 14, 
  textStyle = {TextStyle.None}, 
  textColor = {0, 0, 0}, 
  verticalAlignment = TextAlignment.Top) }), 
  Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
  function func_CCaller
  input SysplorerEmbeddedCoder.Types.Auto extobj annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto inputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[3])));
  input SysplorerEmbeddedCoder.Types.Auto input_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));
  input SysplorerEmbeddedCoder.Types.Auto input_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));

  input SysplorerEmbeddedCoder.Types.Auto input_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto input_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto output_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto output_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  output SysplorerEmbeddedCoder.Types.Auto outputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto has_input annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto has_output annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
    annotation(Protection(access=Access.packageDuplicate));
  external "C" StepJuliaFunction(extobj,inputdat,input_dims,input_types,input_count,input_dim_max,output_dims,output_types,output_count,output_dim_max,outputdat,has_input,has_output) 
  annotation (
  Library = "julia_function", 
  LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/"
  );
  end func_CCaller;
  SysplorerEmbeddedCoder.Port.Inport inputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[3])), Placement(transformation(origin = {0,-60}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Outport outputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Inport extobj 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,60}, extent = { {-10,-10}, {10,10} })));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dims={-1,-1,-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_types={0,0,0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_count=3 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));


  parameter SysplorerEmbeddedCoder.Types.Auto output_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto output_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  parameter SysplorerEmbeddedCoder.Types.Auto output_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto output_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto has_input=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto has_output=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  equation
  outputdat = func_CCaller(extobj, inputdat, input_dims, input_types,input_count,input_dim_max, output_dims, output_types, output_count,output_dim_max, has_input, has_output);
  end CCaller;
    block SubSystem0 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
SysplorerEmbeddedCoder.Port.Inport u 
annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
SysplorerEmbeddedCoder.Port.Outport y 
annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
equation
connect(u, y) 
annotation(Line(origin = { 50.0, 0.0 }, 
points = { {-160.0, -2.0}, {60.0, -2.0} }, 
color = { 0, 0, 0 }));
end SubSystem0;
    equation
    connect(x.y, c_caller.extobj);
    connect(in_alpha, typeConversion_in_alpha.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,60},{-180,60 } },                             color = { 0,0,0 }));
    connect(typeConversion_in_alpha.y, reshape_in_alpha.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,60},{-120,60} }, 
color = { 0,0,0 }));
    connect(reshape_in_alpha.y, mux.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,60},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_deltaz, typeConversion_in_deltaz.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,0},{-180,0 } },                               color = { 0,0,0 }));
    connect(typeConversion_in_deltaz.y, reshape_in_deltaz.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,0},{-120,0} }, 
color = { 0,0,0 }));
    connect(reshape_in_deltaz.y, mux.u2) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,0},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_omegaz, typeConversion_in_omegaz.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,-60},{-180,-60 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_omegaz.y, reshape_in_omegaz.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,-60},{-120,-60} }, 
color = { 0,0,0 }));
    connect(reshape_in_omegaz.y, mux.u3) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,-60},{-60,0} }, 
color = { 0,0,0 }));
    connect(mux.y, c_caller.inputdat) 
annotation(Line(origin = { 0,0 }, 
points = { {-60,0},{0,0} }, 
color = { 0,0,0 }));
    connect(c_caller.outputdat, deMux.u) 
annotation(Line(origin = { 0,0 }, 
points = { {0,0},{60,0} }, 
color = { 0,0,0 }));
    connect(typeConversion_out_result.y, out_result) 
annotation(Line(origin = { 0,0 }, 
points = { {240,0},{300,0} }, 
color = { 0,0,0 }));
    connect(reshape_out_result.y, typeConversion_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {180,0},{240,0} }, 
color = { 0,0,0 }));
    connect(subSystem_out_result.y, reshape_out_result.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {120,0},{180,0} }, 
color = { 0,0,0 }));
    connect(deMux.y1, subSystem_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {60,0},{120,0} }, 
color = { 0,0,0 }));
    end JuliaFunction7;
  block JuliaFunction6 "编辑和调用Julia脚本函数"
    annotation(__MWORKS(BlockSystem(blockKind = BlockKind.composite,bltBlockKind = BltBlockKind.JuliaFunction, 
  SampleTime(auto = true)),PortArrangement(Left(in_alpha,in_deltaz), Right(out_result)),independentInstance=true,sourceModel=SysplorerEmbeddedCoder.Utilities.JuliaFunction,hide=true), Icon(coordinateSystem(extent = {{-240, -130}, {240, 130}}, grid = {2, 2}), 
      graphics = {Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-240, 130}, {240, -130}}), Line(origin = {5, -3}, points = {{-65, -47}, {0, 65}, {65, -47},{-65, -47}}, color = {179, 179, 179}, thickness = 20), 
      Text(origin = {0, -100}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%block_textstring", fontSize = 16, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Center), 
      Text(origin = {6.217248937900877e-15, -152}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = " %name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

  constant String block_textstring="Cy";

    class JuliaFunctionExtObj
      extends ExternalObject;

      function constructor

        input SysplorerEmbeddedCoder.Types.Auto funcName 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        input SysplorerEmbeddedCoder.Types.Auto scriptText 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        output JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" obj = InitJuliaFunction(funcName, scriptText) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end constructor;

      function destructor
        input JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" ExitJuliaFunction(obj) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end destructor;

      annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
    end JuliaFunctionExtObj;



    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;


    ExternalObject_T x "外部对象构造组件" annotation(
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="Cy",u2(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="base64=ZnVuY3Rpb24gQ3koYWxwaGEsIGRlbHRheikJCQkKCQogICAgQ3kyYWxwaGEgPSAwLjI5OAogICAgQ3kyZGVsdGFheiA9IC0wLjA0CiAgICBhbHBoYSA9IHJhZDJkZWcoYWxwaGEpCiAgICBkZWx0YXogPSByYWQyZGVnKGRlbHRheikKCiAgICByZXN1bHQgPSBDeTJhbHBoYSphbHBoYSArIEN5MmRlbHRheipkZWx0YXoKICAgIApyZXR1cm4gcmVzdWx0CQkJCmVuZA=="),y(Type(inherit=InheritType.none ,ref=JuliaFunctionExtObj) ,Dimension(dimensionType=DimensionType.none)=1)),SampleTime(group="D1")=0.02)));




  CCaller c_caller 
  annotation (Placement(transformation(origin = {0, 0}, extent = {{-20, -10}, {20, 10}})),__MWORKS(BlockSystem(SampleTime(group="")=0.02)));
    SysplorerEmbeddedCoder.SignalRouting.Mux mux(portNumber=2) 
      annotation (Placement(transformation(origin={-60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1,u2)))));
    SysplorerEmbeddedCoder.SignalRouting.DeMux deMux(portNumber=1) 
      annotation (Placement(transformation(origin={60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1)))));
    SysplorerEmbeddedCoder.Port.Inport in_alpha 
    annotation(Placement(transformation(origin = { -240,30 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,30 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_alpha(isSaturate=false) 
  annotation(Placement(transformation(origin = { -180,30 }, 
  extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_alpha 
  annotation(Placement(transformation(origin = { -120,30 }, 
  extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_deltaz 
    annotation(Placement(transformation(origin = { -240,-30 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-30 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_deltaz(isSaturate=false) 
  annotation(Placement(transformation(origin = { -180,-30 }, 
  extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_deltaz 
  annotation(Placement(transformation(origin = { -120,-30 }, 
  extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Outport out_result 
  annotation(Placement(transformation(origin = { 300,0 }, 
  extent = { {-6.5,-6.5},{6.5,6.5} }), 
  iconTransformation(origin = { 301.8,0 }, 
  extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_result(isSaturate=false) 
  annotation(Placement(transformation(origin = { 240,0 }, 
  extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_result(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
  annotation(Placement(transformation(origin = { 180,0 }, 
  extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem0 subSystem_out_result 
  annotation(Placement(transformation(origin = { 120,0 }, 
  extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    block CCaller
  annotation(
  __MWORKS(PortArrangement(Left(extobj,inputdat), Right(outputdat)),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
  Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
  fillColor = {255, 255, 255}, 
  fillPattern = FillPattern.Solid, 
  extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
  extent = {{-200.0, 20.0}, {200, -20}}, 
  textString = "StepFunc_juliaobj", 
  verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
  lineColor = {0, 0, 0}, 
  extent = {{-150, 20}, {150, -20}}, 
  textString = "%name", 
  fontSize = 14, 
  textStyle = {TextStyle.None}, 
  textColor = {0, 0, 0}, 
  verticalAlignment = TextAlignment.Top) }), 
  Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
  function func_CCaller
  input SysplorerEmbeddedCoder.Types.Auto extobj annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto inputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[2])));
  input SysplorerEmbeddedCoder.Types.Auto input_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));
  input SysplorerEmbeddedCoder.Types.Auto input_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));

  input SysplorerEmbeddedCoder.Types.Auto input_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto input_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto output_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto output_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  output SysplorerEmbeddedCoder.Types.Auto outputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto has_input annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto has_output annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
    annotation(Protection(access=Access.packageDuplicate));
  external "C" StepJuliaFunction(extobj,inputdat,input_dims,input_types,input_count,input_dim_max,output_dims,output_types,output_count,output_dim_max,outputdat,has_input,has_output) 
  annotation (
  Library = "julia_function", 
  LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/"
  );
  end func_CCaller;
  SysplorerEmbeddedCoder.Port.Inport inputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[2])), Placement(transformation(origin = {0,-60}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Outport outputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Inport extobj 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,60}, extent = { {-10,-10}, {10,10} })));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dims={-1,-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_types={0,0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[2])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_count=2 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));


  parameter SysplorerEmbeddedCoder.Types.Auto output_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto output_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  parameter SysplorerEmbeddedCoder.Types.Auto output_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto output_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto has_input=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto has_output=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  equation
  outputdat = func_CCaller(extobj, inputdat, input_dims, input_types,input_count,input_dim_max, output_dims, output_types, output_count,output_dim_max, has_input, has_output);
  end CCaller;
    block SubSystem0 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
  SysplorerEmbeddedCoder.Port.Inport u 
  annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
  SysplorerEmbeddedCoder.Port.Outport y 
  annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
  annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
  equation
  connect(u, y) 
  annotation(Line(origin = { 50.0, 0.0 }, 
  points = { {-160.0, -2.0}, {60.0, -2.0} }, 
  color = { 0, 0, 0 }));
  end SubSystem0;
    equation
    connect(x.y, c_caller.extobj);
    connect(in_alpha, typeConversion_in_alpha.u) 
  annotation(Line(origin = { 0,0 }, 
  points = { { -240,30},{-180,30 } },                             color = { 0,0,0 }));
    connect(typeConversion_in_alpha.y, reshape_in_alpha.u1) 
  annotation(Line(origin = { 0,0 }, 
  points = { {-180,30},{-120,30} }, 
  color = { 0,0,0 }));
    connect(reshape_in_alpha.y, mux.u1) 
  annotation(Line(origin = { 0,0 }, 
  points = { {-120,30},{-60,0} }, 
  color = { 0,0,0 }));
    connect(in_deltaz, typeConversion_in_deltaz.u) 
  annotation(Line(origin = { 0,0 }, 
  points = { { -240,-30},{-180,-30 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_deltaz.y, reshape_in_deltaz.u1) 
  annotation(Line(origin = { 0,0 }, 
  points = { {-180,-30},{-120,-30} }, 
  color = { 0,0,0 }));
    connect(reshape_in_deltaz.y, mux.u2) 
  annotation(Line(origin = { 0,0 }, 
  points = { {-120,-30},{-60,0} }, 
  color = { 0,0,0 }));
    connect(mux.y, c_caller.inputdat) 
  annotation(Line(origin = { 0,0 }, 
  points = { {-60,0},{0,0} }, 
  color = { 0,0,0 }));
    connect(c_caller.outputdat, deMux.u) 
  annotation(Line(origin = { 0,0 }, 
  points = { {0,0},{60,0} }, 
  color = { 0,0,0 }));
    connect(typeConversion_out_result.y, out_result) 
  annotation(Line(origin = { 0,0 }, 
  points = { {240,0},{300,0} }, 
  color = { 0,0,0 }));
    connect(reshape_out_result.y, typeConversion_out_result.u) 
  annotation(Line(origin = { 0,0 }, 
  points = { {180,0},{240,0} }, 
  color = { 0,0,0 }));
    connect(subSystem_out_result.y, reshape_out_result.u1) 
  annotation(Line(origin = { 0,0 }, 
  points = { {120,0},{180,0} }, 
  color = { 0,0,0 }));
    connect(deMux.y1, subSystem_out_result.u) 
  annotation(Line(origin = { 0,0 }, 
  points = { {60,0},{120,0} }, 
  color = { 0,0,0 }));
    end JuliaFunction6;
  model ModelWorkspace
    annotation(__MWORKS(hide = true,BlockSystem(blockKind=BlockKind.modelWorkspace)));
    constant RealAuto m0 = 45 annotation(__MWORKS(BlockSystem(Type(inherit=InheritType.none ,ref="double"))),HideResult=true);
    constant RealAuto v0 = 100 annotation(__MWORKS(BlockSystem(Type(inherit=InheritType.none ,ref="double"))),HideResult=true);
    constant RealAuto theta0 = 0 annotation(__MWORKS(BlockSystem(Type(inherit=InheritType.none ,ref="double"))),HideResult=true);
    constant RealAuto x0 = 0 annotation(__MWORKS(BlockSystem(Type(inherit=InheritType.none ,ref="double"))),HideResult=true);
    constant RealAuto y0 = 3000 annotation(__MWORKS(BlockSystem(Type(inherit=InheritType.none ,ref="double"))),HideResult=true);
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
  block Scope2 "显示仿真过程中生成的信号"

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

  end Scope2;
  block Scope3 "显示仿真过程中生成的信号"

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

  end Scope3;
  block Scope4 "显示仿真过程中生成的信号"

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

  end Scope4;
  block Scope5 "显示仿真过程中生成的信号"

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

  end Scope5;
  block Scope6 "显示仿真过程中生成的信号"

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

  end Scope6;
  block Scope7 "显示仿真过程中生成的信号"

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

  end Scope7;
  block JuliaFunction9 "编辑和调用Julia脚本函数"
    annotation(__MWORKS(BlockSystem(blockKind = BlockKind.composite,bltBlockKind = BltBlockKind.JuliaFunction, 
SampleTime(auto = true)),PortArrangement(Left(in_Cy,in_rou,in_V), Right(out_result)),independentInstance=true,sourceModel=SysplorerEmbeddedCoder.Utilities.JuliaFunction,hide=true), Icon(coordinateSystem(extent = {{-240, -130}, {240, 130}}, grid = {2, 2}), 
      graphics = {Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-240, 130}, {240, -130}}), Line(origin = {5, -3}, points = {{-65, -47}, {0, 65}, {65, -47},{-65, -47}}, color = {179, 179, 179}, thickness = 20), 
      Text(origin = {0, -100}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%block_textstring", fontSize = 16, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Center), 
      Text(origin = {6.217248937900877e-15, -152}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = " %name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

  constant String block_textstring="Y";

    class JuliaFunctionExtObj
      extends ExternalObject;

      function constructor

        input SysplorerEmbeddedCoder.Types.Auto funcName 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        input SysplorerEmbeddedCoder.Types.Auto scriptText 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        output JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" obj = InitJuliaFunction(funcName, scriptText) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end constructor;

      function destructor
        input JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" ExitJuliaFunction(obj) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end destructor;

      annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
    end JuliaFunctionExtObj;



    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;


    ExternalObject_T x "外部对象构造组件" annotation(
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="Y",u2(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="base64=ZnVuY3Rpb24gWShDeSwgcm91LCBWKQkJCQoKICAgIFMgPSAwLjAxNQogICAgcSA9IDAuNSpyb3UqVl4yCgogICAgcmVzdWx0ID0gQ3kqcSpTCgpyZXR1cm4gcmVzdWx0CQkJCmVuZA=="),y(Type(inherit=InheritType.none ,ref=JuliaFunctionExtObj) ,Dimension(dimensionType=DimensionType.none)=1)),SampleTime(group="D1")=0.02)));



  /**/
  CCaller c_caller 
  annotation (Placement(transformation(origin = {0, 0}, extent = {{-20, -10}, {20, 10}})),__MWORKS(BlockSystem(SampleTime(group="")=0.02)));
    SysplorerEmbeddedCoder.SignalRouting.Mux mux(portNumber=3) 
      annotation (Placement(transformation(origin={-60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1,u2,u3)))));
    SysplorerEmbeddedCoder.SignalRouting.DeMux deMux(portNumber=1) 
      annotation (Placement(transformation(origin={60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1)))));
    SysplorerEmbeddedCoder.Port.Inport in_Cy 
    annotation(Placement(transformation(origin = { -240,60 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,60 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_Cy(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,60 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_Cy 
annotation(Placement(transformation(origin = { -120,60 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_rou 
    annotation(Placement(transformation(origin = { -240,0 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,0 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_rou(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_rou 
annotation(Placement(transformation(origin = { -120,0 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_V 
    annotation(Placement(transformation(origin = { -240,-60 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-60 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_V(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,-60 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_V 
annotation(Placement(transformation(origin = { -120,-60 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Outport out_result 
annotation(Placement(transformation(origin = { 300,0 }, 
extent = { {-6.5,-6.5},{6.5,6.5} }), 
iconTransformation(origin = { 301.8,0 }, 
extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_result(isSaturate=false) 
annotation(Placement(transformation(origin = { 240,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_result(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
annotation(Placement(transformation(origin = { 180,0 }, 
extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem0 subSystem_out_result 
annotation(Placement(transformation(origin = { 120,0 }, 
extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    block CCaller
  annotation(
  __MWORKS(PortArrangement(Left(extobj,inputdat), Right(outputdat)),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
  Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
  fillColor = {255, 255, 255}, 
  fillPattern = FillPattern.Solid, 
  extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
  extent = {{-200.0, 20.0}, {200, -20}}, 
  textString = "StepFunc_juliaobj", 
  verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
  lineColor = {0, 0, 0}, 
  extent = {{-150, 20}, {150, -20}}, 
  textString = "%name", 
  fontSize = 14, 
  textStyle = {TextStyle.None}, 
  textColor = {0, 0, 0}, 
  verticalAlignment = TextAlignment.Top) }), 
  Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
  function func_CCaller
  input SysplorerEmbeddedCoder.Types.Auto extobj annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto inputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[3])));
  input SysplorerEmbeddedCoder.Types.Auto input_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));
  input SysplorerEmbeddedCoder.Types.Auto input_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));

  input SysplorerEmbeddedCoder.Types.Auto input_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto input_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto output_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto output_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  output SysplorerEmbeddedCoder.Types.Auto outputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto has_input annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto has_output annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
    annotation(Protection(access=Access.packageDuplicate));
  external "C" StepJuliaFunction(extobj,inputdat,input_dims,input_types,input_count,input_dim_max,output_dims,output_types,output_count,output_dim_max,outputdat,has_input,has_output) 
  annotation (
  Library = "julia_function", 
  LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/"
  );
  end func_CCaller;
  SysplorerEmbeddedCoder.Port.Inport inputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[3])), Placement(transformation(origin = {0,-60}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Outport outputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Inport extobj 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,60}, extent = { {-10,-10}, {10,10} })));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dims={-1,-1,-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_types={0,0,0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_count=3 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));


  parameter SysplorerEmbeddedCoder.Types.Auto output_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto output_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  parameter SysplorerEmbeddedCoder.Types.Auto output_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto output_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto has_input=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto has_output=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  equation
  outputdat = func_CCaller(extobj, inputdat, input_dims, input_types,input_count,input_dim_max, output_dims, output_types, output_count,output_dim_max, has_input, has_output);
  end CCaller;
    block SubSystem0 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
SysplorerEmbeddedCoder.Port.Inport u 
annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
SysplorerEmbeddedCoder.Port.Outport y 
annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
equation
connect(u, y) 
annotation(Line(origin = { 50.0, 0.0 }, 
points = { {-160.0, -2.0}, {60.0, -2.0} }, 
color = { 0, 0, 0 }));
end SubSystem0;
    equation
    connect(x.y, c_caller.extobj);
    connect(in_Cy, typeConversion_in_Cy.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,60},{-180,60 } },                             color = { 0,0,0 }));
    connect(typeConversion_in_Cy.y, reshape_in_Cy.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,60},{-120,60} }, 
color = { 0,0,0 }));
    connect(reshape_in_Cy.y, mux.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,60},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_rou, typeConversion_in_rou.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,0},{-180,0 } },                               color = { 0,0,0 }));
    connect(typeConversion_in_rou.y, reshape_in_rou.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,0},{-120,0} }, 
color = { 0,0,0 }));
    connect(reshape_in_rou.y, mux.u2) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,0},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_V, typeConversion_in_V.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,-60},{-180,-60 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_V.y, reshape_in_V.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,-60},{-120,-60} }, 
color = { 0,0,0 }));
    connect(reshape_in_V.y, mux.u3) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,-60},{-60,0} }, 
color = { 0,0,0 }));
    connect(mux.y, c_caller.inputdat) 
annotation(Line(origin = { 0,0 }, 
points = { {-60,0},{0,0} }, 
color = { 0,0,0 }));
    connect(c_caller.outputdat, deMux.u) 
annotation(Line(origin = { 0,0 }, 
points = { {0,0},{60,0} }, 
color = { 0,0,0 }));
    connect(typeConversion_out_result.y, out_result) 
annotation(Line(origin = { 0,0 }, 
points = { {240,0},{300,0} }, 
color = { 0,0,0 }));
    connect(reshape_out_result.y, typeConversion_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {180,0},{240,0} }, 
color = { 0,0,0 }));
    connect(subSystem_out_result.y, reshape_out_result.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {120,0},{180,0} }, 
color = { 0,0,0 }));
    connect(deMux.y1, subSystem_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {60,0},{120,0} }, 
color = { 0,0,0 }));
    end JuliaFunction9;
  block JuliaFunction8 "编辑和调用Julia脚本函数"
    annotation(__MWORKS(BlockSystem(blockKind = BlockKind.composite,bltBlockKind = BltBlockKind.JuliaFunction, 
SampleTime(auto = true)),PortArrangement(Left(in_Cx,in_rou,in_V), Right(out_result)),independentInstance=true,sourceModel=SysplorerEmbeddedCoder.Utilities.JuliaFunction,hide=true), Icon(coordinateSystem(extent = {{-240, -130}, {240, 130}}, grid = {2, 2}), 
      graphics = {Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-240, 130}, {240, -130}}), Line(origin = {5, -3}, points = {{-65, -47}, {0, 65}, {65, -47},{-65, -47}}, color = {179, 179, 179}, thickness = 20), 
      Text(origin = {0, -100}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%block_textstring", fontSize = 16, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Center), 
      Text(origin = {6.217248937900877e-15, -152}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = " %name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

  constant String block_textstring="X";

    class JuliaFunctionExtObj
      extends ExternalObject;

      function constructor

        input SysplorerEmbeddedCoder.Types.Auto funcName 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        input SysplorerEmbeddedCoder.Types.Auto scriptText 
          annotation(__MWORKS(BlockSystem(
          Type(inherit = InheritType.none, ref = "string"), 
          Dimension(dimensionType = DimensionType.none) = 1)));

        output JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" obj = InitJuliaFunction(funcName, scriptText) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end constructor;

      function destructor
        input JuliaFunctionExtObj obj;
        annotation(Protection(access=Access.packageDuplicate));

      external "C" ExitJuliaFunction(obj) annotation(
        Library = "julia_function", 
        LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/");
      end destructor;

      annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
    end JuliaFunctionExtObj;



    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;


    ExternalObject_T x "外部对象构造组件" annotation(
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="X",u2(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="base64=ZnVuY3Rpb24gWChDeCwgcm91LCBWKQkJCQoKICAgIFMgPSAwLjAxNQogICAgcSA9IDAuNSpyb3UqKFZeMikKCiAgICByZXN1bHQgPSBDeCpxKlMKCnJldHVybiByZXN1bHQJCQkKZW5k"),y(Type(inherit=InheritType.none ,ref=JuliaFunctionExtObj) ,Dimension(dimensionType=DimensionType.none)=1)),SampleTime(group="D1")=0.02)));



  /**/
  CCaller c_caller 
  annotation (Placement(transformation(origin = {0, 0}, extent = {{-20, -10}, {20, 10}})),__MWORKS(BlockSystem(SampleTime(group="")=0.02)));
    SysplorerEmbeddedCoder.SignalRouting.Mux mux(portNumber=3) 
      annotation (Placement(transformation(origin={-60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(u(u1,u2,u3)))));
    SysplorerEmbeddedCoder.SignalRouting.DeMux deMux(portNumber=1) 
      annotation (Placement(transformation(origin={60,0}, 
  extent={{-1.25,-10},{1.25,10}})),__MWORKS(BlockSystem(Instance(y(y1)))));
    SysplorerEmbeddedCoder.Port.Inport in_Cx 
    annotation(Placement(transformation(origin = { -240,60 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,60 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_Cx(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,60 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_Cx 
annotation(Placement(transformation(origin = { -120,60 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_rou 
    annotation(Placement(transformation(origin = { -240,0 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,0 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_rou(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_rou 
annotation(Placement(transformation(origin = { -120,0 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Inport in_V 
    annotation(Placement(transformation(origin = { -240,-60 }, 
    extent = { {-6.5,-6.5},{6.5,6.5} }), 
    iconTransformation(origin = { -301.8,-60 }, 
    extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none,                             ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_in_V(isSaturate=false) 
annotation(Placement(transformation(origin = { -180,-60 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap), Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_in_V 
annotation(Placement(transformation(origin = { -120,-60 }, 
extent = { {-10,-10},{10,10} })));
    SysplorerEmbeddedCoder.Port.Outport out_result 
annotation(Placement(transformation(origin = { 300,0 }, 
extent = { {-6.5,-6.5},{6.5,6.5} }), 
iconTransformation(origin = { 301.8,0 }, 
extent = { {-1.8,-1.8},{1.8,1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1,                                Dimension(dimensionType = DimensionType.none) = 1, Type(inherit = InheritType.none, ref = "double"))));
    SysplorerEmbeddedCoder.MathOperation.TypeConversion typeConversion_out_result(isSaturate=false) 
annotation(Placement(transformation(origin = { 240,0 }, 
extent = { {-20,-10},{20,10} })), __MWORKS(BlockSystem(Type(overflowKind = SysplorerEmbeddedCoder.Types.OverflowKind.wrap),                             Instance(y(Type(inherit = InheritType.none, ref = "double"))))));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape_out_result(dim=[0],outputDimensionality=SysplorerEmbeddedCoder.MathOperation.Reshape.OutputDimensionType.customize) 
annotation(Placement(transformation(origin = { 180,0 }, 
extent = { {-10,-10},{10,10} })), __MWORKS(BlockSystem(Instance(y(Dimension(dimensionType = DimensionType.none) = 1)))));
    SubSystem0 subSystem_out_result 
annotation(Placement(transformation(origin = { 120,0 }, 
extent = { {-30,-12},{30,12} })), __MWORKS(PortLabels(labelType = "PortName")));
    block CCaller
  annotation(
  __MWORKS(PortArrangement(Left(extobj,inputdat), Right(outputdat)),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
  Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
  fillColor = {255, 255, 255}, 
  fillPattern = FillPattern.Solid, 
  extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
  extent = {{-200.0, 20.0}, {200, -20}}, 
  textString = "StepFunc_juliaobj", 
  verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
  lineColor = {0, 0, 0}, 
  extent = {{-150, 20}, {150, -20}}, 
  textString = "%name", 
  fontSize = 14, 
  textStyle = {TextStyle.None}, 
  textColor = {0, 0, 0}, 
  verticalAlignment = TextAlignment.Top) }), 
  Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
  preserveAspectRatio = false, 
  initialScale = 0.1, 
  grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
  function func_CCaller
  input SysplorerEmbeddedCoder.Types.Auto extobj annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto inputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[3])));
  input SysplorerEmbeddedCoder.Types.Auto input_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));
  input SysplorerEmbeddedCoder.Types.Auto input_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));

  input SysplorerEmbeddedCoder.Types.Auto input_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto input_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  input SysplorerEmbeddedCoder.Types.Auto output_dims annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_types annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto output_count annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto output_dim_max annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  output SysplorerEmbeddedCoder.Types.Auto outputdat annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"),Dimension(dimensionType = DimensionType.none)=[1])));
  input SysplorerEmbeddedCoder.Types.Auto has_input annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  input SysplorerEmbeddedCoder.Types.Auto has_output annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
    annotation(Protection(access=Access.packageDuplicate));
  external "C" StepJuliaFunction(extobj,inputdat,input_dims,input_types,input_count,input_dim_max,output_dims,output_types,output_count,output_dim_max,outputdat,has_input,has_output) 
  annotation (
  Library = "julia_function", 
  LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library/"
  );
  end func_CCaller;
  SysplorerEmbeddedCoder.Port.Inport inputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[3])), Placement(transformation(origin = {0,-60}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Outport outputdat 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none)=[1])), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
  SysplorerEmbeddedCoder.Port.Inport extobj 
  annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=JuliaFunctionExtObj), Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,60}, extent = { {-10,-10}, {10,10} })));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dims={-1,-1,-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_types={0,0,0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[3])));

  parameter SysplorerEmbeddedCoder.Types.Auto input_count=3 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto input_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));


  parameter SysplorerEmbeddedCoder.Types.Auto output_dims={-1} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));

  parameter SysplorerEmbeddedCoder.Types.Auto output_types={0} annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"),Dimension(dimensionType = DimensionType.none)=[1])));
  parameter SysplorerEmbeddedCoder.Types.Auto output_count=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto output_dim_max=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  parameter SysplorerEmbeddedCoder.Types.Auto has_input=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
  parameter SysplorerEmbeddedCoder.Types.Auto has_output=1 annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));

  equation
  outputdat = func_CCaller(extobj, inputdat, input_dims, input_types,input_count,input_dim_max, output_dims, output_types, output_count,output_dim_max, has_input, has_output);
  end CCaller;
    block SubSystem0 "选择子系统模块的设置.要启用涉及代码生成的相关参数, 请选择 '视为原子单元' ."
SysplorerEmbeddedCoder.Port.Inport u 
annotation(Placement(transformation(origin = { -310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
SysplorerEmbeddedCoder.Port.Outport y 
annotation(Placement(transformation(origin = { 310, 0 }, extent = { {-10, -10}, {10, 10} }), iconTransformation(extent = { {-1.8, -1.8}, {1.8, 1.8} })), __MWORKS(BlockSystem(SampleTime(auto = true) = -1, Dimension(dimensionType = DimensionType.none) = [1], Type(inherit = InheritType.none, ref = "double"))));
annotation(__MWORKS(PortArrangement(Left(u), Right(y)), BlockSystem(blockKind = BlockKind.subSystem, SampleTime(auto = true), SubSystem(virtual = true, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")), sourceModel = SysplorerEmbeddedCoder.SubSystems.SubSystem, independentInstance = true, hide = true), Icon(coordinateSystem(extent = { {-300, -120}, {300, 120} }, grid = { 2, 2 }), graphics = { Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{-200, 20}, {200, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top) }));
equation
connect(u, y) 
annotation(Line(origin = { 50.0, 0.0 }, 
points = { {-160.0, -2.0}, {60.0, -2.0} }, 
color = { 0, 0, 0 }));
end SubSystem0;
    equation
    connect(x.y, c_caller.extobj);
    connect(in_Cx, typeConversion_in_Cx.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,60},{-180,60 } },                             color = { 0,0,0 }));
    connect(typeConversion_in_Cx.y, reshape_in_Cx.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,60},{-120,60} }, 
color = { 0,0,0 }));
    connect(reshape_in_Cx.y, mux.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,60},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_rou, typeConversion_in_rou.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,0},{-180,0 } },                               color = { 0,0,0 }));
    connect(typeConversion_in_rou.y, reshape_in_rou.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,0},{-120,0} }, 
color = { 0,0,0 }));
    connect(reshape_in_rou.y, mux.u2) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,0},{-60,0} }, 
color = { 0,0,0 }));
    connect(in_V, typeConversion_in_V.u) 
annotation(Line(origin = { 0,0 }, 
points = { { -240,-60},{-180,-60 } },                           color = { 0,0,0 }));
    connect(typeConversion_in_V.y, reshape_in_V.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {-180,-60},{-120,-60} }, 
color = { 0,0,0 }));
    connect(reshape_in_V.y, mux.u3) 
annotation(Line(origin = { 0,0 }, 
points = { {-120,-60},{-60,0} }, 
color = { 0,0,0 }));
    connect(mux.y, c_caller.inputdat) 
annotation(Line(origin = { 0,0 }, 
points = { {-60,0},{0,0} }, 
color = { 0,0,0 }));
    connect(c_caller.outputdat, deMux.u) 
annotation(Line(origin = { 0,0 }, 
points = { {0,0},{60,0} }, 
color = { 0,0,0 }));
    connect(typeConversion_out_result.y, out_result) 
annotation(Line(origin = { 0,0 }, 
points = { {240,0},{300,0} }, 
color = { 0,0,0 }));
    connect(reshape_out_result.y, typeConversion_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {180,0},{240,0} }, 
color = { 0,0,0 }));
    connect(subSystem_out_result.y, reshape_out_result.u1) 
annotation(Line(origin = { 0,0 }, 
points = { {120,0},{180,0} }, 
color = { 0,0,0 }));
    connect(deMux.y1, subSystem_out_result.u) 
annotation(Line(origin = { 0,0 }, 
points = { {60,0},{120,0} }, 
color = { 0,0,0 }));
    end JuliaFunction8;
  block Scope8 "显示仿真过程中生成的信号"

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

  end Scope8;
  block Scope9 "显示仿真过程中生成的信号"

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

  end Scope9;
  block SubSystem1 "选择子系统模块的设置。 要启用涉及代码生成的相关参数, 请选择 '视为原子单元' 。"

    annotation (__MWORKS(PortArrangement(Top(actionPort)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),independentInstance=true,hide=true,sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem), Icon(coordinateSystem(extent={{-300, -120}, {300, 120}}, grid={2, 2}), graphics={Rectangle(origin = {0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-300, 120}, {300, -120}}), Text(origin = {6.217248937900877e-15, -142}, lineColor = {0, 0, 0}, extent = {{0, 20}, {0, -20}}, textString = "%name", fontSize = 14, textStyle = {TextStyle.None}, textColor = {0, 0, 0}, verticalAlignment = TextAlignment.Top)}),Protection(access=Access.packageDuplicate));
    SysplorerEmbeddedCoder.Utilities.StopSimulation stopSimulation 
      annotation (Placement(transformation(origin={-65.351,-104.71}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(Instance(u(Type(ref="double") ,Dimension=1)),SampleTime(group="D1")=0.6)));
    SysplorerEmbeddedCoder.SubSystems.ActionPort actionPort 
      annotation (Placement(transformation(origin={-84.5283,-76.0756}, 
extent={{-6,-6},{6,6}})),__MWORKS(portFlag="%actionPort(if (u1 <= 0))",BlockSystem(Dimension=1,SampleTime(group="D0")=0)));
    SysplorerEmbeddedCoder.Sources.Constant constant1(k=1) 
      annotation (Placement(transformation(origin={-108.038,-105.132}, 
extent={{-10,-10},{10,10}})),__MWORKS(BlockSystem(SampleTime(auto=true,group="D0")=0,Instance(y(Type(ref="double") ,Dimension=1) ,k(Type(ref="double") ,Dimension=1)))));
  equation
    connect(constant1.y, stopSimulation.u) 
    annotation(Line(origin={-86,-106}, 
points={{-10.2379,0.867755},{8.849,0.867755},{8.849,1.29}}, 
color={0,0,0}));
    end SubSystem1;
  block ToFile "向指定CSV文件中写入数据"
    annotation(__MWORKS(PortArrangement(Left(inport)),BlockSystem(blockKind=Types.BlockKind.composite, bltBlockKind=Types.BltBlockKind.toFile, SampleTime(auto=true)=-1),sourceModel=SysplorerEmbeddedCoder.Utilities.ToFile,independentInstance=true,hide=true),Icon(coordinateSystem(extent={{-100,-100},{100,100}}, 
  grid={2,2}),graphics = {Rectangle(origin={0,0}, 
  fillColor={255,255,255}, 
  fillPattern=FillPattern.Solid, 
  extent={{-100,100},{100,-100}}), Text(origin={0,-3}, 
  lineColor={0,0,0}, 
  extent={{-86,19},{86,-19}}, 
  textString="%file_name", 
  textStyle={TextStyle.None}, 
  textColor={0,0,0}, 
  horizontalAlignment=LinePattern.None), Text(origin={7.10543e-15,-120}, 
  extent={{0,20},{0,-20}}, 
  textString="%name", 
  fontSize=14, 
  verticalAlignment=TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

      class WriteData "外部对象类定义"
        extends ExternalObject;

        function constructor
          input SysplorerEmbeddedCoder.Types.Auto file_name 
            annotation(__MWORKS(BlockSystem(
            Type(inherit = InheritType.none, ref = "string"), 
            Dimension(dimensionType = DimensionType.none) = 1)));
          input SysplorerEmbeddedCoder.Types.Auto  dimension 
            annotation(__MWORKS(BlockSystem(
            Type(inherit = InheritType.none, ref = "int32"), 
            Dimension(dimensionType = DimensionType.none) = 1)));
          input SysplorerEmbeddedCoder.Types.Auto  extract_size 
            annotation(__MWORKS(BlockSystem(
            Type(inherit = InheritType.none, ref = "int32"), 
            Dimension(dimensionType = DimensionType.none) = 1)));
          output WriteData obj;
          annotation(Protection(access=Access.packageDuplicate));
        external "C" obj = __WriteInit(file_name, dimension, extract_size) annotation(
          Include = "#include \"ToFile.c\"");
        end constructor;

        function destructor
          input WriteData obj;
          annotation(Protection(access=Access.packageDuplicate));
        external "C" __WriteDestory(obj) annotation(
          Include = "#include \"ToFile.c\"");
        end destructor;

        annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
      end WriteData;

    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;

    parameter SysplorerEmbeddedCoder.Types.Auto file_name = "res.csv" 
            annotation(HideResult = true,__MWORKS(BlockSystem(
            Type(inherit = InheritType.none, ref = "string"), 
            Dimension(dimensionType = DimensionType.none) = 1)));

    parameter SysplorerEmbeddedCoder.Types.Auto var_name = "ans" 
            annotation(HideResult = true,__MWORKS(BlockSystem(
            Type(inherit = InheritType.none, ref = "string"), 
            Dimension(dimensionType = DimensionType.none) = 1)));

    parameter SysplorerEmbeddedCoder.Types.Auto extract = 1 
            annotation(HideResult = true, __MWORKS(BlockSystem(blkParameter = true, 
            Type(inherit = InheritType.none, ref = "int32"), 
            Dimension(dimensionType = DimensionType.none) = 1)));

    inner ExternalObject_T x "外部对象构造组件" annotation(HideResult = true, 
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)=loadResource("modelica://Q20/X_data.csv"),u2(Type(inherit=InheritType.none ,ref="int32") ,Dimension(dimensionType=DimensionType.none)=1)=size(reshape.y,1),u3(Type(inherit=InheritType.none ,ref="int32") ,Dimension(dimensionType=DimensionType.none)=1)=1),y(Type(inherit=InheritType.none ,ref=WriteData) ,Dimension(dimensionType=DimensionType.none)=1)))));

    block ExternalObjectReference "框图外部对象引用模块"
      outer SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")))));  // 外部对象输出

      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObjectReference)),Protection(access=Access.packageDuplicate));
    end ExternalObjectReference;

    ExternalObjectReference extObjRef "外部对象引用组件" annotation(
      __MWORKS(BlockSystem(name = "x")));
    CCaller c_caller 
      annotation(HideResult = true, Placement(transformation(origin={35,-36.6333}, 
  extent={{-105,-73.3667},{105,73.3666875}})), __MWORKS(BlockSystem(SampleTime(group="D0")=0),ComponentNamePlacement(BOTTOM)));
    SysplorerEmbeddedCoder.Sources.Clock clock 
      annotation(HideResult = true, Placement(transformation(origin={-198,-36.6333}, 
  extent={{-10,-10},{10,10}})), __MWORKS(ComponentNamePlacement(BOTTOM)));
    SysplorerEmbeddedCoder.Port.Inport inport 
      annotation(Placement(transformation(origin={-198,-85.5444}, 
  extent={{-10,-10},{10,10}}), 
  iconTransformation(origin={-101.8,0}, 
  extent={{-1.8,-1.8},{1.8,1.8}})),__MWORKS(BlockSystem(Type(inherit=InheritType.none,ref="double"),Dimension(dimensionType=DimensionType.auto),SampleTime=-1)));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape 
      annotation (HideResult = true, Placement(transformation(origin={-134,-85.5444}, 
  extent={{-10,-10},{10,10}})));
    block CCaller
        annotation(
         __MWORKS(PortArrangement(Left(p,in_time,d), Right(out)),PortLabels(labelType="CustomType",labels(label(text="p",instance="p"),label(text="in_time",instance="in_time"),label(text="d",instance="d"),label(text="out",instance="out"))),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
              Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
              preserveAspectRatio = false, 
              initialScale = 0.1, 
              grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
              fillColor = {255, 255, 255}, 
              fillPattern = FillPattern.Solid, 
              extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
              extent = {{-200.0, 20.0}, {200, -20}}, 
              textString = "__WriteFileArray", 
              verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
              lineColor = {0, 0, 0}, 
              extent = {{-150, 20}, {150, -20}}, 
              textString = "%name", 
              fontSize = 14, 
             textStyle = {TextStyle.None}, 
              textColor = {0, 0, 0}, 
              verticalAlignment = TextAlignment.Top) }), 
          Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
              preserveAspectRatio = false, 
              initialScale = 0.1, 
              grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
      function func_CCaller
      output SysplorerEmbeddedCoder.Types.Auto out annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"), Dimension(dimensionType = DimensionType.none) = 1)));
      input SysplorerEmbeddedCoder.Types.Auto p annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=WriteData), Dimension(dimensionType = DimensionType.none) = 1)));
      input SysplorerEmbeddedCoder.Types.Auto in_time annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"), Dimension(dimensionType = DimensionType.none) = 1)));
      input SysplorerEmbeddedCoder.Types.Auto d[:] annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double")/*, Dimension(dimensionType = DimensionType.none) = [4]*/)));
        annotation(Protection(access=Access.packageDuplicate));
      external "C" out=__WriteFile(p,in_time,d,size(d,1)) 
    annotation (Include = "#include \"ToFile.c\"", 
      IncludeDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Include/File");
    end func_CCaller;
        SysplorerEmbeddedCoder.Port.Inport p 
        annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = WriteData),Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
        SysplorerEmbeddedCoder.Port.Inport in_time 
        annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
        SysplorerEmbeddedCoder.Port.Inport d 
        annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.auto) = -1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
        SysplorerEmbeddedCoder.Port.Outport out 
        annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
      equation
      out = func_CCaller(p, in_time, d);
    end CCaller;
    equation
    connect(extObjRef.y, c_caller.p);
    connect(c_caller.in_time, clock.y) 
      annotation(Line(origin={-101,-47}, 
  points={{29.2,10.3667},{-85.2,10.3667}}, 
  color={0,0,0}));
   connect(inport, reshape.u1) 
    annotation(Line(origin={-165,-92}, 
  points={{-21,6.45556},{19.2,6.45556}}, 
  color={0,0,0}));
    connect(c_caller.d, reshape.y) 
    annotation(Line(origin={-97,-92}, 
  points={{25.2,6.45556},{-25.2,6.45556}}, 
  color={0,0,0}));
    end ToFile;
  block ToFile1 "向指定CSV文件中写入数据"
    annotation(__MWORKS(PortArrangement(Left(inport)),BlockSystem(blockKind=Types.BlockKind.composite, bltBlockKind=Types.BltBlockKind.toFile, SampleTime(auto=true)=-1),sourceModel=SysplorerEmbeddedCoder.Utilities.ToFile,independentInstance=true,hide=true),Icon(coordinateSystem(extent={{-100,-100},{100,100}}, 
  grid={2,2}),graphics = {Rectangle(origin={0,0}, 
  fillColor={255,255,255}, 
  fillPattern=FillPattern.Solid, 
  extent={{-100,100},{100,-100}}), Text(origin={0,-3}, 
  lineColor={0,0,0}, 
  extent={{-86,19},{86,-19}}, 
  textString="%file_name", 
  textStyle={TextStyle.None}, 
  textColor={0,0,0}, 
  horizontalAlignment=LinePattern.None), Text(origin={7.10543e-15,-120}, 
  extent={{0,20},{0,-20}}, 
  textString="%name", 
  fontSize=14, 
  verticalAlignment=TextAlignment.Top)}),Protection(access=Access.packageDuplicate));

      class WriteData "外部对象类定义"
        extends ExternalObject;

        function constructor
          input SysplorerEmbeddedCoder.Types.Auto file_name 
            annotation(__MWORKS(BlockSystem(
            Type(inherit = InheritType.none, ref = "string"), 
            Dimension(dimensionType = DimensionType.none) = 1)));
          input SysplorerEmbeddedCoder.Types.Auto  dimension 
            annotation(__MWORKS(BlockSystem(
            Type(inherit = InheritType.none, ref = "int32"), 
            Dimension(dimensionType = DimensionType.none) = 1)));
          input SysplorerEmbeddedCoder.Types.Auto  extract_size 
            annotation(__MWORKS(BlockSystem(
            Type(inherit = InheritType.none, ref = "int32"), 
            Dimension(dimensionType = DimensionType.none) = 1)));
          output WriteData obj;
          annotation(Protection(access=Access.packageDuplicate));
        external "C" obj = __WriteInit(file_name, dimension, extract_size) annotation(
          Include = "#include \"ToFile.c\"");
        end constructor;

        function destructor
          input WriteData obj;
          annotation(Protection(access=Access.packageDuplicate));
        external "C" __WriteDestory(obj) annotation(
          Include = "#include \"ToFile.c\"");
        end destructor;

        annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
      end WriteData;

    block ExternalObject_T "框图外部对象构造模块"
      SysplorerEmbeddedCoder.Types.InputAuto u annotation(
        __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
      SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
    end ExternalObject_T;

    parameter SysplorerEmbeddedCoder.Types.Auto file_name = "res.csv" 
            annotation(HideResult = true,__MWORKS(BlockSystem(
            Type(inherit = InheritType.none, ref = "string"), 
            Dimension(dimensionType = DimensionType.none) = 1)));

    parameter SysplorerEmbeddedCoder.Types.Auto var_name = "ans" 
            annotation(HideResult = true,__MWORKS(BlockSystem(
            Type(inherit = InheritType.none, ref = "string"), 
            Dimension(dimensionType = DimensionType.none) = 1)));

    parameter SysplorerEmbeddedCoder.Types.Auto extract = 1 
            annotation(HideResult = true, __MWORKS(BlockSystem(blkParameter = true, 
            Type(inherit = InheritType.none, ref = "int32"), 
            Dimension(dimensionType = DimensionType.none) = 1)));

    inner ExternalObject_T x "外部对象构造组件" annotation(HideResult = true, 
      __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)=loadResource("modelica://Q20/Y_data.csv"),u2(Type(inherit=InheritType.none ,ref="int32") ,Dimension(dimensionType=DimensionType.none)=1)=size(reshape.y,1),u3(Type(inherit=InheritType.none ,ref="int32") ,Dimension(dimensionType=DimensionType.none)=1)=1),y(Type(inherit=InheritType.none ,ref=WriteData) ,Dimension(dimensionType=DimensionType.none)=1)))));

    block ExternalObjectReference "框图外部对象引用模块"
      outer SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
        __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")))));  // 外部对象输出

      annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic, 
        bltBlockKind = Types.BltBlockKind.externalObjectReference)),Protection(access=Access.packageDuplicate));
    end ExternalObjectReference;

    ExternalObjectReference extObjRef "外部对象引用组件" annotation(
      __MWORKS(BlockSystem(name = "x")));
    CCaller c_caller 
      annotation(HideResult = true, Placement(transformation(origin={35,-36.6333}, 
  extent={{-105,-73.3667},{105,73.3666875}})), __MWORKS(BlockSystem(SampleTime(group="D0")=0),ComponentNamePlacement(BOTTOM)));
    SysplorerEmbeddedCoder.Sources.Clock clock 
      annotation(HideResult = true, Placement(transformation(origin={-198,-36.6333}, 
  extent={{-10,-10},{10,10}})), __MWORKS(ComponentNamePlacement(BOTTOM)));
    SysplorerEmbeddedCoder.Port.Inport inport 
      annotation(Placement(transformation(origin={-198,-85.5444}, 
  extent={{-10,-10},{10,10}}), 
  iconTransformation(origin={-101.8,0}, 
  extent={{-1.8,-1.8},{1.8,1.8}})),__MWORKS(BlockSystem(Type(inherit=InheritType.none,ref="double"),Dimension(dimensionType=DimensionType.auto),SampleTime=-1)));
    SysplorerEmbeddedCoder.MathOperation.Reshape reshape 
      annotation (HideResult = true, Placement(transformation(origin={-134,-85.5444}, 
  extent={{-10,-10},{10,10}})));
    block CCaller
        annotation(
         __MWORKS(PortArrangement(Left(p,in_time,d), Right(out)),PortLabels(labelType="CustomType",labels(label(text="p",instance="p"),label(text="in_time",instance="in_time"),label(text="d",instance="d"),label(text="out",instance="out"))),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller,SampleTime=-1),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true), 
              Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} }, 
              preserveAspectRatio = false, 
              initialScale = 0.1, 
              grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0}, 
              fillColor = {255, 255, 255}, 
              fillPattern = FillPattern.Solid, 
              extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0}, 
              extent = {{-200.0, 20.0}, {200, -20}}, 
              textString = "__WriteFileArray", 
              verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0}, 
              lineColor = {0, 0, 0}, 
              extent = {{-150, 20}, {150, -20}}, 
              textString = "%name", 
              fontSize = 14, 
             textStyle = {TextStyle.None}, 
              textColor = {0, 0, 0}, 
              verticalAlignment = TextAlignment.Top) }), 
          Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} }, 
              preserveAspectRatio = false, 
              initialScale = 0.1, 
              grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
      function func_CCaller
      output SysplorerEmbeddedCoder.Types.Auto out annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"), Dimension(dimensionType = DimensionType.none) = 1)));
      input SysplorerEmbeddedCoder.Types.Auto p annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=WriteData), Dimension(dimensionType = DimensionType.none) = 1)));
      input SysplorerEmbeddedCoder.Types.Auto in_time annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"), Dimension(dimensionType = DimensionType.none) = 1)));
      input SysplorerEmbeddedCoder.Types.Auto d[:] annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double")/*, Dimension(dimensionType = DimensionType.none) = [4]*/)));
        annotation(Protection(access=Access.packageDuplicate));
      external "C" out=__WriteFile(p,in_time,d,size(d,1)) 
    annotation (Include = "#include \"ToFile.c\"", 
      IncludeDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Include/File");
    end func_CCaller;
        SysplorerEmbeddedCoder.Port.Inport p 
        annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = WriteData),Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
        SysplorerEmbeddedCoder.Port.Inport in_time 
        annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
        SysplorerEmbeddedCoder.Port.Inport d 
        annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.auto) = -1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
        SysplorerEmbeddedCoder.Port.Outport out 
        annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
      equation
      out = func_CCaller(p, in_time, d);
    end CCaller;
    equation
    connect(extObjRef.y, c_caller.p);
    connect(c_caller.in_time, clock.y) 
      annotation(Line(origin={-101,-47}, 
  points={{29.2,10.3667},{-85.2,10.3667}}, 
  color={0,0,0}));
   connect(inport, reshape.u1) 
    annotation(Line(origin={-165,-92}, 
  points={{-21,6.45556},{19.2,6.45556}}, 
  color={0,0,0}));
    connect(c_caller.d, reshape.y) 
    annotation(Line(origin={-97,-92}, 
  points={{25.2,6.45556},{-25.2,6.45556}}, 
  color={0,0,0}));
    end ToFile1;
  block Scope10 "显示仿真过程中生成的信号"

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

  end Scope10;
  equation
  connect(juliaFunction4.out_result, integrator.u1) 
  annotation(Line(origin={-157,-50}, 
points={{-6.5962,-0.1887},{5.46479,-0.1887}}, 
color={0,0,0}));
  connect(integrator.y, m.u1) 
  annotation(Line(origin={-118,-50}, 
points={{-9.93521,-0.1887},{7.9359,-0.1887},{7.9359,0.0755}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(integrator.y, juliaFunction4.in_m) 
  annotation(Line(origin={-167,-65}, 
points={{39.065,14.8113},{48.9245,14.8113},{48.9245,-6.05662},{-50.3962,-6.05662},{-50.3962,14.8113},{-37.1018,14.8113}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction.in_m, integrator.y) 
  annotation(Line(origin={-168,9}, 
points={{-33.8068,88.1725},{-49.1321,88.1725},{-49.1321,-80.5849},{50.1887,-80.5849},{50.1887,-59.1887},{40.065,-59.1887}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction1.in_m, integrator.y) 
  annotation(Line(origin={-168,-7}, 
points={{-33.9888,71.544},{-49.3963,71.544},{-49.3963,-64.0565},{50.1887,-64.0565},{50.1887,-43.1887},{40.065,-43.1887}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction3.out_result, integrator4.u1) 
  annotation(Line(origin={-157,-15}, 
  points={{-6.3702,0.6981},{6.52037,0.6981},{6.52037,0.207532}}, 
  color={0,0,0}));
  connect(juliaFunction2.out_result, integrator3.u1) 
  annotation(Line(origin={-157,21}, 
  points={{-5.8042,0.1321},{6.78452,0.1321},{6.78452,-0.396242}}, 
  color={0,0,0}));
  connect(juliaFunction1.out_result, integrator2.u1) 
  annotation(Line(origin={-155,56}, 
  points={{-6.4832,-0.5283},{5.57697,-0.5283},{5.57697,-0.264166}}, 
  color={0,0,0}));
  connect(juliaFunction.out_result, integrator1.u1) 
  annotation(Line(origin={-155,89}, 
  points={{-6.3012,0.0074},{5.31318,0.0074},{5.31318,-0.245289}}, 
  color={0,0,0}));
  connect(juliaFunction4.out_P, juliaFunction.in_P) 
  annotation(Line(origin={-193,4}, 
points={{29.4038,-59.6321},{36.0943,-59.6321},{36.0943,-82.9811},{-33.1132,-82.9811},{-33.1132,87.7291},{-8.8068,87.7291}}, 
color={0,0,0}));
  connect(juliaFunction1.in_P, juliaFunction4.out_P) 
  annotation(Line(origin={-192,-14}, 
points={{-9.9888,69.4717},{-33.5849,69.4717},{-33.5849,-64.4528},{34.8302,-64.4528},{34.8302,-41.6321},{28.4038,-41.6321}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(integrator1.y, v.u1) 
  annotation(Line(origin={-118,89}, 
points={{-8.087,-0.2453},{8.9548,-0.2453},{8.9548,-0.0188943}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(integrator1.y, juliaFunction1.in_V) 
  annotation(Line(origin={-169,85}, 
points={{42.913,3.7547},{51.4528,3.7547},{51.4528,24.8868},{-51.566,24.8868},{-51.566,-24.0849},{-32.9888,-24.0849}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(alpha.y, juliaFunction.in_alpha) 
  annotation(Line(origin={-223,91}, 
  points={{-20.8981,2.24525},{-13.9434,2.24525},{-13.9434,-1.9926},{21.1932,-1.9926}}, 
  color={0,0,0}));
  connect(alpha.y, juliaFunction1.in_alpha) 
  annotation(Line(origin={-223,72}, 
  points={{-20.898,21.2453},{-13.6792,21.2453},{-13.6792,-20.883},{21.0112,-20.883}}, 
  color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(deltaz.y, juliaFunction6.in_deltaz) 
  annotation(Line(origin={-34.1698,-23.6415}, 
points={{-9.63662,5.5427},{12.86,5.5427},{12.86,-11.1228}}, 
color={0,0,0}));
  connect(deltaz.y, juliaFunction7.in_deltaz) 
  annotation(Line(origin={-34.1698,-39.6415}, 
points={{-9.63662,21.5427},{-1.22642,21.5427},{-1.22642,-27.717},{12.59649,-27.717}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(integrator2.y, theta.u1) 
  annotation(Line(origin={-118,55}, 
points={{-7.823,0.7358},{9.25665,0.7358}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(integrator3.y, X.u1) 
  annotation(Line(origin={-119,20}, 
points={{-7.615,0.6038},{9.46415,0.6038},{9.46415,0.0754717}}, 
color={0,0,0}));
  connect(integrator4.y, Y.u1) 
  annotation(Line(origin={-119,-15}, 
points={{-7.88,0.2075},{9.7283,0.2075},{9.7283,-0.0566038}}, 
color={0,0,0}));
  connect(alpha.y, juliaFunction5.in_alpha) 
  annotation(Line(origin={-117,66}, 
points={{-126.898,27.2453},{-120.208,27.2453},{-120.208,50.2264},{87.702,50.2264},{87.702,-56.52831},{95.653,-56.52831}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction6.in_alpha, alpha.y) 
  annotation(Line(origin={-117,49}, 
points={{95.6902,-72.8775},{87.6792,-72.8775},{87.6792,67.7547},{-120.208,67.7547},{-120.208,44.2453},{-126.898,44.2453}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction7.in_alpha, alpha.y) 
  annotation(Line(origin={-117,31}, 
points={{95.42669,-91.1006},{87.7663,-91.1006},{87.7663,85.1999},{-120.208,85.1999},{-120.208,62.2453},{-126.898,62.2453}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(integrator2.y, juliaFunction7.in_omegaz) 
  annotation(Line(origin={-58,-7}, 
points={{-67.823,62.7358},{-61.1321,62.7358},{-61.1321,45.9359},{16.6154,45.9359},{16.6154,-67.6164},{36.4267,-67.6164}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction2.in_V, integrator1.y) 
  annotation(Line(origin={-169,68}, 
  points={{-34.3098,-41.4245},{-51.8302,-41.4245},{-51.8302,41.8868},{51.4528,41.8868},{51.4528,20.7547},{42.913,20.7547}}, 
  color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction3.in_V, integrator1.y) 
  annotation(Line(origin={-169,51}, 
  points={{-34.8758,-59.8585},{-51.8302,-59.8585},{-51.8302,58.8868},{51.4528,58.8868},{51.4528,37.7547},{42.913,37.7547}}, 
  color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(integrator2.y, juliaFunction2.in_theta) 
  annotation(Line(origin={-165,36}, 
points={{39.177,19.7358},{46.1321,19.7358},{46.1321,3.51698},{-45.7925,3.51698},{-45.7925,-20.3113},{-38.3098,-20.3113}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction3.in_theta, integrator2.y) 
  annotation(Line(origin={-165,18}, 
points={{-38.8758,-37.7453},{-46.0831,-37.7453},{-46.0831,21.2264},{46.1321,21.2264},{46.1321,37.7358},{39.177,37.7358}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction5.out_result, Cx.u1) 
  annotation(Line(origin={32,10}, 
points={{-12.8414,-0.528311},{13.4415,-0.528311},{13.4415,-1.28306}}, 
color={0,0,0}));
  connect(juliaFunction6.out_result, Cy.u1) 
  annotation(Line(origin={32,-29}, 
points={{-12.8042,-0.320858},{14.434,-0.320858},{14.434,-0.807626}}, 
color={0,0,0}));
  connect(juliaFunction7.out_result, mz.u1) 
  annotation(Line(origin={32,-67}, 
points={{-13.0677,-0.3585},{14.6038,-0.4114}}, 
color={0,0,0}));
  connect(juliaFunction5.out_result, juliaFunction8.in_Cx) 
  annotation(Line(origin={23,53}, 
points={{-3.84141,-43.52831},{5.47547,-43.52831},{5.47547,43.32},{-3.35095,43.32}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction6.out_result, juliaFunction9.in_Cy) 
  annotation(Line(origin={27,14}, 
points={{-7.80421,-43.3209},{10.1925,-43.3209},{10.1925,42.3918},{-7.7623,42.3918}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction8.in_V, integrator1.y) 
  annotation(Line(origin={-45,96}, 
points={{64.649054,-13.7202},{88.5849,-13.7202},{88.5849,13.5434},{-72.5472,13.5434},{-72.5472,-7.2453},{-81.087,-7.2453}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction9.in_V, integrator1.y) 
  annotation(Line(origin={-41,76}, 
points={{60.237704,-33.6484},{84.5849,-33.6484},{84.5849,33.5434},{-76.5472,33.5434},{-76.5472,12.7547},{-85.087,12.7547}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction8.out_result, juliaFunction.in_X) 
  annotation(Line(origin={-115,93}, 
points={{94.671654,-3.7001},{76.0642,-3.7001},{76.0642,11.8943},{-94.2075,11.8943},{-94.2075,-12.1577},{-86.8068,-12.1577}}, 
color={0,0,0}));
  connect(juliaFunction9.out_result, juliaFunction1.in_Y) 
  annotation(Line(origin={-114,41}, 
points={{93.2603,8.3717},{60.2453,8.3717},{60.2453,-6.42264},{-93.1736,-6.42264},{-93.1736,5.76226},{-87.9888,5.76226}}, 
color={0,0,0}));
  connect(H2rou.y, juliaFunction8.in_rou) 
  annotation(Line(origin={1,80}, 
points={{-39.917,-9.2075},{31.7518,-9.2075},{31.7518,9.2999},{18.6491,9.2999}}, 
color={0,0,0}));
  connect(juliaFunction9.in_rou, H2rou.y) 
  annotation(Line(origin={1,60}, 
points={{18.237704,-10.6283},{32.0171,-10.6283},{32.0171,10.7925},{-39.917,10.7925}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction1.in_theta, integrator2.y) 
  annotation(Line(origin={-165,47}, 
points={{-36.9888,-0.600633},{-46.3208,-0.600633},{-46.3208,-8.43456},{46.6616,-8.43456},{46.6616,8.7358},{39.177,8.7358}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(juliaFunction.in_theta, integrator2.y) 
  annotation(Line(origin={-165,60}, 
points={{-36.8068,20.298},{-46.5849,20.298},{-46.5849,-21.4346},{47.1911,-21.4346},{47.1911,-4.2642},{39.177,-4.2642}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(x.u1, juliaFunction8.out_result) 
  annotation(Line(origin={-40,89}, 
points={{-20.3132,0.282987},{19.671654,0.2999}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(H2rou.y, rou.u1) 
  annotation(Line(origin={-46,44}, 
points={{7.083,26.7925},{11.6604,26.7925},{11.6604,-13.8868},{-9.73584,-13.8868},{-9.73584,-21.1057}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(integrator4.y, H2rou.u) 
  annotation(Line(origin={-95,28}, 
  points={{-31.88,-42.7925},{-23.6038,-42.7925},{-23.6038,-27.2075},{16.0189,-27.2075},{16.0189,42.7925},{32.483,42.7925}}, 
  color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(if1.y1, subSystem1.actionPort) 
  annotation(Line(origin={-71,-69}, 
points={{3.50134,0.469715},{3.50134,-4.6833},{3.25695,-4.6833}}, 
color={0,0,0}));
  connect(if1.u1, integrator4.y) 
  annotation(Line(origin={-99,-26}, 
points={{31.5013,-13.3236},{31.5013,-8.6581},{-19.4152,-8.6581},{-19.4152,11.2075},{-27.88,11.2075}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(toFile.inport, integrator3.y) 
  annotation(Line(origin={-180,12}, 
points={{-57.3292,-9.61723},{61.657,-9.61723},{61.657,8.6038},{53.385,8.6038}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(toFile1.inport, integrator4.y) 
  annotation(Line(origin={-175,-25}, 
points={{-62.8587,-9.9469},{56.3923,-9.9469},{56.3923,10.2075},{48.12,10.2075}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  connect(P.u1, juliaFunction4.out_P) 
  annotation(Line(origin={-201,-68}, 
points={{-36.9864,-10.7159},{37.4038,-10.7159},{37.4038,12.3679}}, 
color={0,0,0}),__MWORKS(BlockSystem(NamedSignal)));
  end Q20;

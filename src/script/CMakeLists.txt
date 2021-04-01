add_library(CsScript SHARED "")
add_library(CopperSpice::CsScript ALIAS CsScript)

set_target_properties(CsScript PROPERTIES OUTPUT_NAME CsScript${BUILD_ABI})

add_definitions(
    -DQLALR_NO_SCRIPTGRAMMAR_DEBUG_INFO
    -DJS_NO_EXPORT
    -DQLALR_NO_QSCRIPTGRAMMAR_DEBUG_INFO
    -DWTF_USE_JAVASCRIPTCORE_BINDINGS=1
    -DWTF_CHANGES=1
    -DBUILDING_CS=1
    -DWTF_USE_ACCELERATED_COMPOSITING
    -DJSC=QTJSC
    -Djscyyparse=qtjscyyparse
    -Djscyylex=qtjscyylex
    -Djscyyerror=qtjscyyerror
    -DWTF=QTWTF
    -DUSE_SYSTEM_MALLOC
    -DQT_BUILD_SCRIPT_LIB
)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")

   if (CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL "7.1.0")
      set_target_properties(CsScript
         PROPERTIES
         COMPILE_OPTIONS -Wno-expansion-to-defined
      )
   endif()

endif()

set(EXTRA_SCRIPT_CXXFLAGS)
set(EXTRA_SCRIPT_LDFLAGS)

include_directories(
    ${CMAKE_BINARY_DIR}/include
    ${CMAKE_BINARY_DIR}/privateinclude

    ${CMAKE_BINARY_DIR}/include/QtCore
    ${CMAKE_BINARY_DIR}/privateinclude/QtCore/private

    ${CMAKE_BINARY_DIR}/include/QtScript
    ${CMAKE_BINARY_DIR}/privateinclude/QtScript/private

    ${CMAKE_CURRENT_SOURCE_DIR}/api
    ${CMAKE_CURRENT_SOURCE_DIR}/bridge
    ${CMAKE_CURRENT_SOURCE_DIR}/parser

    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecompiler
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/debugger
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/heap
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/interpreter
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/pcre
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/unicode
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wrec
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/unicode
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders
    ${CS_SOURCE_DIR}src/3rdparty/javascriptcore/JavaScriptCore/wtf/qt
)

include(api/api.cmake)
include(bridge/bridge.cmake)
include(parser/parser.cmake)

list(APPEND JSCORE_SCRIPT_INCLUDES
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/CodeBlock.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/Opcode.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/SamplingTool.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/JumpTable.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/Instruction.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/StructureStubInfo.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/EvalCodeCache.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/pcre/pcre_internal.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/pcre/ucpinternal.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/pcre/pcre.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/config.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/JavaScriptCorePrefix.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/OpaqueJSString.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSStringRefBSTR.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JavaScript.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSValueRef.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackFunction.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/APICast.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSObjectRef.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSBasePrivate.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSContextRefPrivate.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSContextRef.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSStringRef.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/WebKitAvailability.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSClassRef.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSBase.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/APIShims.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSStringRefCF.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSProfilerPrivate.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSRetainPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackObjectFunctions.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JavaScriptCore.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/interpreter/Interpreter.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/interpreter/CallFrameClosure.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/interpreter/RegisterFile.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/interpreter/Register.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/interpreter/CachedCall.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/interpreter/CallFrame.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/ArrayPrototype.lut.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/RegExpConstructor.lut.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/RegExpObject.lut.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/Grammar.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/GeneratedJITStubs_RVCT.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/MathObject.lut.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/JSONObject.lut.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/Lexer.lut.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/NumberConstructor.lut.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/StringPrototype.lut.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/DatePrototype.lut.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wrec/WRECParser.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wrec/CharacterClassConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wrec/Escapes.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wrec/CharacterClass.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wrec/Quantifier.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wrec/WRECFunctors.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wrec/WRECGenerator.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wrec/WREC.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITInlineMethods.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/ExecutableAllocator.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITStubs.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITCode.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITStubCall.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JIT.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/OpaqueJSString.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JavaScript.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JSValueRef.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/APICast.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JSObjectRef.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JSContextRef.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JSStringRef.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/WebKitAvailability.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JSBase.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JSStringRefCF.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JSRetainPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/ForwardingHeaders/JavaScriptCore/JavaScriptCore.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/debugger/Debugger.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/debugger/DebuggerActivation.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/debugger/DebuggerCallFrame.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecompiler/Label.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecompiler/LabelScope.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecompiler/RegisterID.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecompiler/BytecodeGenerator.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/CodeLocation.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/ARMAssembler.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/MacroAssemblerCodeRef.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/AssemblerBuffer.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/MacroAssemblerX86_64.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/ARMv7Assembler.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/LinkBuffer.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/RepatchBuffer.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/MacroAssemblerARM.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/MacroAssemblerX86Common.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/MacroAssemblerARMv7.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/MacroAssembler.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/AssemblerBufferWithConstantPool.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/AbstractMacroAssembler.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/MacroAssemblerX86.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/X86Assembler.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ClassInfo.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/TimeoutChecker.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NumberConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalData.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Identifier.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/BooleanPrototype.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/DateConversion.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/DateConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSZombie.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/WeakRandom.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/FunctionConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/CollectorHeapIterator.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ScopeChainMark.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/BatchedTransitionOptimizer.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSVariableObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/PropertyDescriptor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/BooleanConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Completion.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Structure.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/SymbolTable.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/MarkStack.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorPrototype.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSType.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/DatePrototype.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ObjectConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSArray.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NumericStrings.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSActivation.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StringConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSImmediate.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSONObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ObjectPrototype.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NativeErrorPrototype.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ArrayConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSValue.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/DateInstance.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSAPIValueWrapper.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NativeFunctionWrapper.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObjectFunctions.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StringPrototype.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/RegExpMatchesArray.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSByteArray.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Error.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/InitializeThreading.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ArrayPrototype.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/PropertyMapHashTable.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSTypeInfo.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StructureTransitionTable.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NumberPrototype.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/RegExpConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Tracing.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/UStringImpl.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/GetterSetter.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NumberObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Executable.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSPropertyNameIterator.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Lookup.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/UString.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/MathObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/SmallStrings.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/RegExpObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/FunctionPrototype.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/InternalFunction.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/RegExpPrototype.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/BooleanObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Protect.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Arguments.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StructureChain.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSFunction.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/WeakGCMap.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSLock.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/PropertySlot.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSNumberCell.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Operations.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NativeErrorConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ConstructData.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StringObjectThatMasqueradesAsUndefined.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ScopeChain.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorInstance.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/LiteralParser.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSCell.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ExceptionHelpers.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/PrototypeFunction.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/WeakGCPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/PropertyNameArray.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSString.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/GlobalEvalFunction.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/DateInstanceCache.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StringBuilder.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/PutPropertySlot.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorConstructor.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSWrapperObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/CommonIdentifiers.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSNotAnObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/RegExp.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/CallData.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StringObject.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/SourceProvider.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/ResultType.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/ParserArena.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/Nodes.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/NodeInfo.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/Lexer.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/SourceCode.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/NodeConstructors.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/Parser.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/ThreadSpecific.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/RefCountedLeakCounter.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/PassRefPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/HashFunctions.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/HashMap.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/HashIterators.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/SegmentedVector.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Vector.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/TypeTraits.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/TCPackedCache.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/ASCIICType.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/android/AndroidThreading.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/dtoa.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/RefPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/TCSpinLock.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/OwnArrayPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Platform.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/PossiblyNull.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/MessageQueue.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Forward.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/TCSystemAlloc.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/StringHashFunctions.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/CurrentTime.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/MainThread.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/FastAllocBase.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/CrossThreadRefCounted.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/MathExtras.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Threading.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/StdLibExtras.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/RandomNumberSeed.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/RandomNumber.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/DateMath.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/PtrAndFlags.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/GetPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/ByteArray.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/OwnPtrCommon.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/ListRefPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/HashTraits.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/VectorTraits.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/AVLTree.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Assertions.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/unicode/Collator.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/unicode/qt4/UnicodeQt4.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/unicode/UTF8.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/unicode/Unicode.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Locker.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/StringExtras.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/DisallowCType.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/FastMalloc.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/RefCounted.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/HashTable.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/MallocZoneSupport.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/OwnPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Deque.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Noncopyable.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/TCPageMap.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/HashSet.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/RefPtrHashMap.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/ThreadIdentifierDataPthreads.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/PassOwnPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/NotFound.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/VMTags.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/RetainPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/OwnFastMallocPtr.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/AlwaysInline.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/HashCountedSet.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/UnusedParam.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/ListHashSet.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/yarr/RegexJIT.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/yarr/RegexInterpreter.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/yarr/RegexPattern.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/yarr/RegexParser.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/yarr/RegexCompiler.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler/Profiler.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler/Profile.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler/ProfileGenerator.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler/ProfileNode.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler/ProfilerServer.h
    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler/CallIdentifier.h

    # https://bugreports.qt.io/browse/QTBUG-9958
    # ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/chartables.c

    ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/pcre/ucptable.cpp
)

target_sources(CsScript
   PRIVATE
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSBase.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackFunction.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSCallbackObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSClassRef.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSContextRef.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSObjectRef.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSStringRef.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/JSValueRef.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/API/OpaqueJSString.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/ARMAssembler.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/assembler/MacroAssemblerARM.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/CodeBlock.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/JumpTable.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/Opcode.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/SamplingTool.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecode/StructureStubInfo.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecompiler/BytecodeGenerator.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/bytecompiler/NodesCodegen.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/debugger/DebuggerActivation.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/debugger/DebuggerCallFrame.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/debugger/Debugger.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/interpreter/CallFrame.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/interpreter/Interpreter.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/interpreter/RegisterFile.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/ExecutableAllocatorFixedVMPool.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/ExecutableAllocatorPosix.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/ExecutableAllocatorWin.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/ExecutableAllocator.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITArithmetic.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITCall.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JIT.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITOpcodes.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITPropertyAccess.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/jit/JITStubs.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/Lexer.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/Nodes.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/ParserArena.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/parser/Parser.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler/Profile.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler/ProfileGenerator.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler/ProfileNode.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/profiler/Profiler.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ArgList.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Arguments.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ArrayConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ArrayPrototype.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/BooleanConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/BooleanObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/BooleanPrototype.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/CallData.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Collector.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/CommonIdentifiers.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Completion.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ConstructData.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/DateConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/DateConversion.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/DateInstance.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/DatePrototype.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Error.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorInstance.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ErrorPrototype.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ExceptionHelpers.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Executable.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/FunctionConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/FunctionPrototype.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/GetterSetter.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/GlobalEvalFunction.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Identifier.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/InitializeThreading.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/InternalFunction.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSActivation.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSAPIValueWrapper.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSArray.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSByteArray.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSCell.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSFunction.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalData.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSGlobalObjectFunctions.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSImmediate.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSLock.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSNotAnObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSNumberCell.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSONObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSPropertyNameIterator.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSStaticScopeObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSString.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSValue.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSVariableObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/JSWrapperObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/LiteralParser.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Lookup.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/MarkStackPosix.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/MarkStackWin.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/MarkStack.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/MathObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NativeErrorConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NativeErrorPrototype.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NumberConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NumberObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/NumberPrototype.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ObjectConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ObjectPrototype.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Operations.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/PropertyDescriptor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/PropertyNameArray.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/PropertySlot.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/PrototypeFunction.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/RegExpConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/RegExp.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/RegExpObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/RegExpPrototype.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/ScopeChain.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/SmallStrings.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StringConstructor.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StringObject.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StringPrototype.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/StructureChain.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/Structure.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/TimeoutChecker.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/UString.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/runtime/UStringImpl.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Assertions.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/ByteArray.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/CurrentTime.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/DateMath.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/dtoa.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/FastMalloc.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/HashTable.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/MainThread.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/qt/MainThreadQt.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/qt/ThreadingQt.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/RandomNumber.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/RefCountedLeakCounter.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/ThreadingNone.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/Threading.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/TypeTraits.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/unicode/CollatorDefault.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/wtf/unicode/UTF8.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/yarr/RegexCompiler.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/yarr/RegexInterpreter.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/yarr/RegexJIT.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/generated/Grammar.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/pcre/pcre_compile.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/pcre/pcre_exec.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/pcre/pcre_tables.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/pcre/pcre_ucp_searchfuncs.cpp
   ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/pcre/pcre_xclass.cpp
)

macro_generate_public("${SCRIPT_PUBLIC_INCLUDES}"   QtScript)
macro_generate_private("${SCRIPT_PRIVATE_INCLUDES}" QtScript)
macro_generate_misc("${SCRIPT_INCLUDES}"            QtScript)

if(CMAKE_SYSTEM_NAME MATCHES "Darwin")
   add_definitions(-DENABLE_JSC_MULTIPLE_THREADS=0)

   list(APPEND EXTRA_SCRIPT_LDFLAGS
      -framework
      CoreFoundation
   )

elseif(CMAKE_SYSTEM_NAME MATCHES "Windows")
   target_link_libraries(CsScript
      PRIVATE
      winmm
   )

   if(NOT MSVC)
      list(APPEND EXTRA_SCRIPT_LDFLAGS
         -Wl,-s
      )
   endif()

   list(APPEND SCRIPT_INCLUDES
      ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/os-win32/stdbool.h
      ${CS_SOURCE_DIR}/src/3rdparty/javascriptcore/JavaScriptCore/os-win32/stdint.h
   )

endif()

function_variable_fixup("${EXTRA_SCRIPT_CXXFLAGS}" EXTRA_SCRIPT_CXXFLAGS)
function_variable_fixup("${EXTRA_SCRIPT_LDFLAGS}"  EXTRA_SCRIPT_LDFLAGS)

target_sources(CsScript
   PRIVATE
   ${SCRIPT_INCLUDES}
)

target_include_directories(CsScript
   PUBLIC
   $<INSTALL_INTERFACE:include/QtScript>
)

target_link_libraries(CsScript
   PRIVATE
   CsCore
)

set_target_properties(CsScript
   PROPERTIES
   COMPILE_FLAGS ${EXTRA_SCRIPT_CXXFLAGS}
   LINK_FLAGS ${EXTRA_SCRIPT_LDFLAGS}
)

function_generate_resources(CsScript)

macro_generate_package(
   CsScript
   QtScript
   "${EXTRA_SCRIPT_CXXFLAGS}"
   "CsCore"
)

install(
   TARGETS CsScript
   EXPORT CopperSpiceLibraryTargets ${INSTALL_TARGETS_DEFAULT_ARGS}
   RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
   LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
   ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
)

install(
   DIRECTORY ${CMAKE_BINARY_DIR}/include/QtScript
   DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
   COMPONENT Devel
)

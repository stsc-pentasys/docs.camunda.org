---

title: 'Expression Language'
category: 'Process Engine'

---

camunda BPM supports Unified Expression Language (EL), specified as part of the JSP 2.1 standard
([JSR-245][]). It therefore uses the open source [JUEL][] implementation. To get more general
information about the usage of Expression Language please read the [official documentation][].

Within camunda BPM EL can be used in many circumstances to evaluate small script like
expression. The following table provides an overview of the BPMN elements which support
usage of EL.

<table class="table desc-table">
  <tr>
    <th>BPMN element</th>
    <th>EL support</th>
  </tr>
  <tr>
    <td>
      <a href="#process-engine-expression-language-use-expression-language-as-delegation-code">
        Service Task, Business Rule Task, Send Task,
        Message Intermediate Throwing Event, Message End Event, Execution Listener and
        Task Listener
      </a>
    </td>
    <td>Expression language as delegation code</td>
  </tr>
  <tr>
    <td>
      <a href="#process-engine-expression-language-use-expression-language-as-condition">
        Sequence Flows
      </a>
    </td>
    <td>Expression language as condition expression of a sequence flow</td>
  </tr>
  <tr>
    <td>
        <a href="#process-engine-use-expression-language-as-inputoutput-parameters">
          All Tasks, All Events, Transaction, Subprocess and Connector
        </a>
    </td>
    <td>Expression language inside a inputOutput parameter mapping</td>
  </tr>
</table>


### Use Expression Language as Delegation Code

Besides Java code, camunda BPM also supports the evaluation of expression language as delegation code an execution
listener. For general information about delegation code see the corresponding
[section](ref:#process-engine-delegation-code).

To use expression language as delegation code, the custom attribute `camunda:expression` or
`camunda:delegateExpression` has to be used.

A `camunda:expression` simply evaluated in the current context. This is useful to call your
own methods or easily read/set variables. Whereas `camunda:delegateExpression` has to evaluate to a
delegation object which is a class which implements the `JavaDelegate` or `ActivityBehavior`
interface. The `execute` method of the resolved delegation object is than called on execution.

Inside the expression some special variables are available which enable the access of the current
context. To find more information about the available variables please see the [corresponding
section][variables].

The following example shows some usages of expression language as delegation code:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<definitions id="definitions"
  xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL"
  xmlns:camunda="http://activiti.org/bpmn"
  targetNamespace="Examples">

  <process id="process">
    <extensionElements>
      <camunda:executionListener event="start" expression="${execution.setVariable('test', 'foo')}" />
    </extensionElements>

    <startEvent id="start" />

    <sequenceFlow id="flow1" sourceRef="start" targetRef="task1" />

    <serviceTask id="task1" camunda:delegateExpression="${myBean}" />

    <sequenceFlow id="flow2" sourceRef="task1" targetRef="task2" />

    <userTask id="task2">
      <extensionElements>
        <camunda:taskListener event="complete" expression="${myBean.taskDone(task)}" />
      </extensionElements>
    </userTask>

    <sequenceFlow id="flow3" sourceRef="task2" targetRef="end" />

    <endEvent id="end">
      <messageEventDefinition camunda:expression="${execution.setVariable('done', true)}" />
    </endEvent>

  </process>

</definitions>
```

### Use Expression Language as Conditions

To use conditional sequence flows usually expression language is used. Therefore a
`conditionExpression` element of a sequence flow has to be used of the type `tFormalExpression`.
The text content of the element is the expression to be evaluated.

Inside the expression some special variables are available which enable the access of the current
context. To find more information about the available variables please see the [corresponding
section][variables].

The following example show the usage of expression language as condition of a sequence flow:

```xml
<sequenceFlow>
  <conditionExpression xsi:type="tFormalExpression">
    ${test == 'foo'}
  </conditionExpression>
</sequenceFlow>
```


### Use Expression Language as inputOutput Parameters

With the camunda `inputOutput` extension element you can map an `inputParameter` or `outputParameter`
with expression language.

Inside the expression some special variables are available which enable the access of the current
context. To find more information about the available variables please see the [corresponding
section][variables].

The following example show a `inputParameter` which uses expression language to call a method of
a bean.

```xml
<serviceTask id="task" camunda:class="org.camunda.bpm.example.SumDelegate">
  <extensionElements>
    <camunda:inputOutput>
      <camunda:inputParameter name="x">
        ${myBean.calculateX()}
      </camunda:inputParameter>
    </camunda:inputOutput>
  </extensionElements>
</serviceTask>
```


## Variables available inside expression language

Depending on the current execution context different variables are available inside expression
language. In an execution context like a service task, execution listener or sequence flow the
variable `execution` is available which corresponds to the interface `DelegateExecution`. In a task
context like a task listener the variable `task` exists and corresponds to the `DelegateTask`
interface. Through this variables you have access to the current execution resp. task, process
variables and the current event of a execution or task listener.

The following example shows an expression which sets the variable `test` to the current
event name of an `camunda:executionListener`.

```xml
<camunda:executionListener event="start"
  expression="${execution.setVariable('test', execution.eventName)}" />
```

Also all process variables of the current scope are directly available available inside an
expression. So a conditional sequence flow can directly check a variable.

```xml
<sequenceFlow>
  <conditionExpression xsi:type="tFormalExpression">
    ${test == 'start'}
  </conditionExpression>
</sequenceFlow>
```

Additionally it is possible to use Spring and CDI beans inside of expressions. Please see
the corresponding sections for [Spring][] and [CDI][] for more information. The following
example shows the usage of a bean which implements the JavaDelegate interface as delegateExecution.
With the expression attribute any method of a bean can be called.

```xml
<serviceTask id="task1" camunda:delegateExpression="${myBean}" />

<serviceTask id="task2" camunda:delegateExpression="${myBean.myMethod(execution)}" />
```


[JSR-245]: http://jcp.org/aboutJava/communityprocess/final/jsr245/
[JUEL]: http://juel.sourceforge.net/
[official documentation]: http://docs.oracle.com/javaee/5/tutorial/doc/bnahq.html
[variables]: #process-engine-expression-language-variables-available-inside-expression-language
[Spring]: #spring-framework-integration-expression-resolving
[CDI]: #cdi-and-java-ee-integration-expression-resolving

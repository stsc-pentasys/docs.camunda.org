---

title: "Get Single Variable Instance"
category: 'Variable'

keywords: 'get'

---


Retrieves a single variable by id.


Method
------

GET `/variable-instance/{id}`


Parameters
----------

#### Path Parameters

<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>The id of the variable instance.</td>
  </tr>
</table>


Result
------

A json object with the following properties:

<table class="table table-striped">
  <tr>
    <th>Name</th>
    <th>Value</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>id</td>
    <td>String</td>
    <td>The id of the variable instance.</td>
  </tr>
  <tr>
    <td>name</td>
    <td>String</td>
    <td>The name of the variable instance.</td>
  </tr>
  <tr>
    <td>type</td>
    <td>String</td>
    <td>The simple class name of the variable value.</td>
  </tr>
  <tr>
    <td>variableType</td>
    <td>String</td>
    <td>The type of the variable instance. Refer to the documentation on <a href="ref:/guides/user-guide/#process-engine-process-variables-variable-types">process variable types</a>.</td>
  </tr>
  <tr>
    <td>value</td>
    <td>String/Number/Boolean</td>
    <td><p>The variable's value if it is a primitive variable. The variable's serialized value if it is a custom object variable with a text-based serialization format. <code>null</code> for variable types that serialize as byte array (i.e. variable types <code>bytes</code> and <code>serializable</code>). Refer to the documentation on <a href="ref:/guides/user-guide/#process-engine-process-variables-variable-types">process variable types</a>.</p>
    <p>
    <b>Deprecated</b>: For variables of type <code>serializable</code>, a json object applying Jackson's POJO
    serialization is returned. Note that this is only returned when the involved classes are accessible to the REST resources.
    </p></td>
  </tr>
  <tr>
    <td>serializationConfig</td>
    <td>Object</td>
    <td>A json object containing additional variable meta-data required to interpret the value. Exact properties depend on the variable type. For all primitive variable types this property is <code>null</code>. Refer to the documentation on <a href="ref:/guides/user-guide/#process-engine-process-variables-variable-types">process variable types</a>.
    </td>
  </tr>
  <tr>
    <td>processInstanceId</td>
    <td>String</td>
    <td>The id of the process instance that this variable instance belongs to.</td>
  </tr>
  <tr>
    <td>executionId</td>
    <td>String</td>
    <td>The id of the execution that this variable instance belongs to.</td>
  </tr>
  <tr>
    <td>caseInstanceId</td>
    <td>String</td>
    <td>The id of the case instance that this variable instance belongs to.</td>
  </tr>
  <tr>
    <td>caseExecutionId</td>
    <td>String</td>
    <td>The id of the case execution that this variable instance belongs to.</td>
  </tr>
  <tr>
    <td>taskId</td>
    <td>String</td>
    <td>The id of the task that this variable instance belongs to.</td>
  </tr>
  <tr>
    <td>activityInstanceId</td>
    <td>String</td>
    <td>The id of the activity instance that this variable instance belongs to.</td>
  </tr>  
  <tr>
    <td>errorMessage</td>
    <td>String</td>
    <td>An error message in case a Java Serialized Object could not be de-serialized.</td>
  </tr>
</table>

Response codes
--------------

<table class="table table-striped">
  <tr>
    <th>Code</th>
    <th>Media type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>200</td>
    <td>application/json</td>
    <td>Request successful.</td>
  </tr>
  <tr>
    <td>404</td>
    <td>application/json</td>
    <td>Variable with given id does not exist. See the <a href="ref:#overview-introduction">Introduction</a> for the error response format.</td>
  </tr>
</table>

Example
-------

#### Request

GET `/variable-instance/someId`
  
#### Response

Status 200.

    {
      "id": "someId",
      "name": "amount",
      "type": "Integer",
      "variableType": "integer",
      "value": 5,
      "processInstanceId": "aProcessInstanceId",
      "executionId": "b68b71c9-e310-11e2-beb0-f0def1557726",
      "taskId": null,
      "activityInstanceId": "Task_1:b68b71ca-e310-11e2-beb0-f0def1557726",
      "caseExecutionId": null,
      "caseInstanceId": null,
      "errorMessage": null,
      "serializationConfig": null
    }

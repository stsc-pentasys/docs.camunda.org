---

title: 'Post Single Case Execution Variable (Binary)'
category: 'Case Execution'

keywords: 'post update set binary'

---

Sets the serialized value for a binary variable.

Method
------

POST `/case-execution/{id}/variables/{varId}/data`


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
    <td>The id of the case execution to set the variable for.</td>
  </tr>
  <tr>
    <td>varId</td>
    <td>The name of the variable to set.</td>
  </tr>
</table>

#### Request Body

A multipart form submit with the following parts:

<table class="table table-striped">
  <tr>
    <th>Form Part Name</th>
    <th>Content Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>data</td>
    <td>application/octet-stream</td>
    <td>The binary data to be set.</td>
  </tr>
  <tr>
    <td>data</td>
    <td>application/json</td>
    <td>
      <p><b>Deprecated</b>: This only works if the REST API is aware of the involved Java classes.</p>
      <p>A JSON representation of a serialized Java Object. Form part <code>type</code> (see below) must be provided.</p>
    </td>
  </tr>
  <tr>
    <td>type</td>
    <td>text/plain</td>
    <td>
      <p><b>Deprecated</b>: This only works if the REST API is aware of the involved Java classes.</p>
      <p>The canonical java type name of the case variable to be set. Example: <code>foo.bar.Customer</code>. If this part is provided, <code>data</code> must be a JSON object which can be converted into a case execution of the provided class. The content type of the <code>data</code> part must be <code>application/json</code> in that case (see above).
      </p>
    </td>
  </tr>  
  <!-- Comment in as soon as setting serialized values for case executions is part of the REST API
  <tr>
    <td>variableType</td>
    <td>text/plain</td>
    <td>The type of the variable to set. Example: <code>serializable</code> to set the binary representation for a serializable variable. Default value is `bytes`.</td>
  </tr>  -->
</table>


Result
------

This method returns no content.

  
Response codes
--------------  

<table class="table table-striped">
  <tr>
    <th>Code</th>
    <th>Media type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>204</td>
    <td></td>
    <td>Request successful.</td>
  </tr>
  <tr>
    <td>400</td>
    <td>application/json</td>
    <td>The variable value or type is invalid, for example if the value could not be parsed to an Integer value or the passed variable type is not supported. See the <a href="ref:#overview-introduction">Introduction</a> for the error response format.</td>
  </tr>    
</table>

  
Example
-------

#### Request

(1) Post binary content of a byte array variable:

POST `/case-execution/aCaseExecutionId/variables/aVarName/data`

```  
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y
Content-Disposition: form-data; name="data"; filename="unspecified"
Content-Type: application/octet-stream
Content-Transfer-Encoding: binary

<<Byte Stream ommitted>>
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y--
```

<!-- comment in as soon as supported for case executions
(2) Post serialized representation of a `serializable` variable:

POST `/case-execution/aCaseExecutionId/variables/aVarName/data`

```  
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y
Content-Disposition: form-data; name="data"; filename="unspecified"
Content-Type: application/octet-stream
Content-Transfer-Encoding: binary

<<Byte Stream ommitted>>
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y
Content-Disposition: form-data; name="variableType"
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

serializable
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y--
```-->

(2) Post the JSON serialization of a Java Class (**deprecated**):

POST `/case-execution/aCaseExecutionId/variables/aVarName/data`

```  
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y
Content-Disposition: form-data; name="data"
Content-Type: application/json; charset=US-ASCII
Content-Transfer-Encoding: 8bit

["foo", "bar"]
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y
Content-Disposition: form-data; name="type"
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

java.util.ArrayList<java.lang.Object>
---OSQH1f8lzs83iXFHphqfIuitaQfNKFY74Y--
```
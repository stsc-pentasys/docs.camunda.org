---

title: 'JNDI Bindings on Apache Tomcat 7'
category: 'Runtime Container Integration'

---

To use the JNDI Bindings for Bpm Platform Services on Apache Tomcat 7 you have to add the file `META-INF/context.xml` to your process application and add the following [ResourceLinks](http://tomcat.apache.org/tomcat-7.0-doc/config/context.html#Resource_Links):

```xml
<Context>
  <ResourceLink name="ProcessEngineService"
    global="global/camunda-bpm-platform/process-engine/ProcessEngineService!org.camunda.bpm.ProcessEngineService"
    type="org.camunda.bpm.ProcessEngineService" />

  <ResourceLink name="ProcessApplicationService"
    global="global/camunda-bpm-platform/process-engine/ProcessApplicationService!org.camunda.bpm.ProcessApplicationService"
    type="org.camunda.bpm.ProcessApplicationService" />
</Context>
```

These elements are used to create a link to the global JNDI Resources defined in `$TOMCAT_HOME/conf/server.xml`.

Furthermore, declare the dependency on the JNDI binding inside the `WEB-INF/web.xml` deployment descriptor.

```xml
<web-app>
  <resource-ref>
    <description>Process Engine Service</description>
    <res-ref-name>ProcessEngineService</res-ref-name>
    <res-type>org.camunda.bpm.ProcessEngineService</res-type>
    <res-auth>Container</res-auth>
  </resource-ref>
  <resource-ref>
    <description>Process Application Service</description>
    <res-ref-name>ProcessApplicationService</res-ref-name>
    <res-type>org.camunda.bpm.ProcessApplicationService</res-type>
    <res-auth>Container</res-auth>
  </resource-ref>
  ...
</web-app>
```

**Note**: You can choose different resource link names for the Process Engine Service and Process Application Service. The resource link name has to match the value inside the `<res-ref-name>`-element inside the corresponding `<resource-ref>`-element in `WEB-INF/web.xml`. We propose the name `ProcessEngineService` for the Process Engine Service and `ProcessApplicationService` for the Process Application Service.

In order to do a lookup for a Bpm Platform Service you have to use the resource link name to get the linked global resource. For example:

* Process Engine Service: `java:comp/env/ProcessEngineService`
* Process Application Service: `java:comp/env/ProcessApplicationService`

If you have declared other resource link names than we proposed, you have to use `java:comp/env/$YOUR_RESOURCE_LINK_NAME` to do a lookup to get the corresponding Bpm Platform Service.
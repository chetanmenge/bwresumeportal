<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<body>

<h1>Uploaded files</h1>

<#if files?? >
  <#list files as file>
  File name = ${file.key} <br>
  </#list>
</#if>

</body>
</html>
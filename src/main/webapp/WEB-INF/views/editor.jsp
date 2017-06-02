<%--
  Created by IntelliJ IDEA.
  User: wangkun23
  Date: 2016/7/14
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <title>Simple example - Editor.md examples</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/editor-md/css/editormd.css"/>
</head>
<body>
<div id="layout">
    <header>
        <h1>Simple example</h1>
    </header>
    <div id="test-editormd">
        <textarea style="display:none;">[TOC]

            #### Disabled options

            - TeX (Based on KaTeX);
            - Emoji;
            - Task lists;
            - HTML tags decode;
            - Flowchart and Sequence Diagram;

            #### Editor.md directory

            editor.md/
            lib/
            css/
            scss/
            tests/
            fonts/
            images/
            plugins/
            examples/
            languages/
            editormd.js
            ...

            ```html
            &lt;!-- English --&gt;
            &lt;script src="../dist/js/languages/en.js"&gt;&lt;/script&gt;

            &lt;!-- 繁體中文 --&gt;
            &lt;script src="../dist/js/languages/zh-tw.js"&gt;&lt;/script&gt;
            ```
        </textarea>
    </div>
</div>
<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/assets/editor-md/editormd.min.js"></script>
<script type="text/javascript">
    var testEditor;

    $(function () {
        testEditor = editormd("test-editormd", {
            width: "90%",
            height: 640,
            syncScrolling: "single",
            path: "${pageContext.servletContext.contextPath}/assets/editor-md/lib/"
        });

        /*
         // or
         testEditor = editormd({
         id      : "test-editormd",
         width   : "90%",
         height  : 640,
         path    : "../lib/"
         });
         */
    });
</script>
</body>
</html>

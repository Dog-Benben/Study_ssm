
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../../../css/bootstrap.min.css" rel="stylesheet">
    <script src="../../../js/jquery-2.2.4.min.js"></script>
    <script src="../../../js/bootstrap.min.js"></script>
    <title>个人信息查看</title>
</head>
<body>

<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">我的信息</h3>
    <form action="/user/user_update" method="post">
        <!--         隐藏域 提交id-->

        <div class="form-group">
            <label for="name">用户名:</label>
            <input type="text" class="form-control" name="name" id="name"  value="${user.name}" readonly="readonly" placeholder="请输入用户名" />
        </div>

        <div class="form-group">
            <label for="sex">性  别:</label>
            <input type="text" class="form-control" id="sex"  name="sex"  value="${user.sex}" readonly="readonly" placeholder="请输入性别" />
        </div>
        <div class="form-group">
            <label for="telephone">手机号:</label>
            <input type="text" class="form-control" value="${user.telephone}" id="telephone"  name="telephone" placeholder="请输入手机号" />
        </div>
        <div class="form-group">
            <label for="address">地  址:</label>
            <input type="text" id="address" class="form-control" value="${user.address}" name="address" placeholder="请输入地址"/>
        </div>
        <div class="form-group">
            <label for="email">邮  箱:</label>
            <input type="text" id="email" class="form-control" value="${user.email}" name="email" placeholder="请输入邮箱"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="修改提交" />
            <a href="/fore/foreHome"><input class="btn btn-default" type="button" value="返回"/></a>
        </div>
    </form>
</div>

    <%--<div style="text-align: center">--%>
        <%--<h1>我的信息</h1>--%>

        <%--<form>--%>
             <%--<tr> 用户名:   ${user.name} </tr>     <br>--%>
             <%--<tr> 性  别:     ${user.sex}  </tr>       <br>--%>
             <%--<tr> 手机号:   ${user.telephone} </tr>         <br>--%>
             <%--<tr>地  址:     ${user.address}</tr>      <br>--%>
             <%--<tr>邮  箱:     ${user.email}</tr>        <br>--%>
             <%--<tr>积分等级: ${user.credit.name}</tr>      <br>--%>
             <%--<tr>积分数量: ${user.credit.number}</tr>    <br>--%>

        <%--</form>--%>
    <%--</div>--%>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<script>
    function showProductsAsideCategorys(cid){
        $("div.eachCategory[cid="+cid+"]").css("background-color","white");
        $("div.eachCategory[cid="+cid+"] a").css("color","#87CEFA");
        $("div.productsAsideCategorys[cid="+cid+"]").show();
    }

    function hideProductsAsideCategorys(cid){
        $("div.eachCategory[cid="+cid+"]").css("background-color","#e2e2e3");
        $("div.eachCategory[cid="+cid+"] a").css("color","#000");
        $("div.productsAsideCategorys[cid="+cid+"]").hide();
    }
    $(function(){
        $("div.eachCategory").mouseenter(function(){
            var cid = $(this).attr("cid");
            showProductsAsideCategorys(cid);
        });
        $("div.eachCategory").mouseleave(function(){
            var cid = $(this).attr("cid");
            hideProductsAsideCategorys(cid);
        });
        $("div.productsAsideCategorys").mouseenter(function(){
            var cid = $(this).attr("cid");
            showProductsAsideCategorys(cid);
        });
        $("div.productsAsideCategorys").mouseleave(function(){
            var cid = $(this).attr("cid");
            hideProductsAsideCategorys(cid);
        });

        $("div.rightMenu span").mouseenter(function(){
            var left = $(this).position().left;
            var top = $(this).position().top;
            // var width = $(this).categoriess("width");
            var width = $(this).width();
            var destLeft = parseInt(left) + parseInt(width)/2;
            $("img#catear").css("left",destLeft);
            $("img#catear").css("top",top-20);
            $("img#catear").fadeIn(500);

        });
        $("div.rightMenu span").mouseleave(function(){
            $("img#catear").hide();
        });

        var left = $("div#carousel-of-product").offset().left;
        $("div.categoryMenu").css("left",left-20);
        $("div.categoryWithCarousel div.head").css("margin-left",left);
        $("div.productsAsideCategorys").css("left",left-20);

    });
</script>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap hello word</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>

<div class="categoryWithCarousel">

    <nav class="navbar navbar-inverse">
        <div class="container">
            <div role="navigation" class="navbar-header">
                <!--汉堡按钮-->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">商品分类</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <c:forEach items="${categories}" var="c" varStatus="st">
                        <c:if test="${st.count<=5}">
                            <li>
                            <a href="forecategory?cid=${c.id}">
                                    ${c.name}
                            </a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>


    <%--<div class="headbar show1">--%>
        <%--<div class="head ">--%>
            <%--<span style="margin-left:50px" class="glyphicon glyphicon-th-list"></span>--%>
            <%--<span style="margin-left:50px" >商品分类</span>--%>
        <%--</div>--%>

        <%--<div class="rightMenu">--%>
            <%--<c:forEach items="${categories}" var="c" varStatus="st">--%>
                <%--<c:if test="${st.count<=5}">--%>
				<%--<span>--%>
				<%--<a href="forecategory?cid=${c.id}">--%>
                        <%--${c.name}--%>
                <%--</a></span>--%>
                <%--</c:if>--%>
            <%--</c:forEach>--%>
        <%--</div>--%>

    <%--</div>--%>

    <%--<div class="categoryMenu" style="margin-top: 37px">--%>
        <%--<c:forEach items="${categories}" var="c">--%>
            <%--<div cid="${c.id}" class="eachCategory">--%>
                <%--<span class="glyphicon glyphicon-link"></span>--%>
                <%--<a href="forecategory?cid=${c.id}">--%>
                        <%--${c.name}--%>
                <%--</a>--%>
            <%--</div>--%>
        <%--</c:forEach>--%>
    <%--</div>--%>

    <%--轮播图--%>
    <div id="carousel-of-product"  class="carousel-of-product carousel slide1" data-ride="carousel">
        <!-- Indicators 轮播图下的圆点图片位置-->
        <%--<ol class="carousel-indicators">--%>
            <%--<li data-target="#carousel-of-product" data-slide-to="0" class="active"></li>--%>
            <%--<li data-target="#carousel-of-product" data-slide-to="1"></li>--%>
            <%--<li data-target="#carousel-of-product" data-slide-to="2"></li>--%>
            <%--<li data-target="#carousel-of-product" data-slide-to="3"></li>--%>
        <%--</ol>--%>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img class="carousel carouselImage" src="/images/carousel/1.jpg" >
            </div>
            <div class="item">
                <img  class="carouselImage" src="/images/carousel/2.jpg" >
            </div>
            <div class="item">
                <img  class="carouselImage" src="/images/carousel/3.jpg" >
            </div>

            <div class="item">
                <img  class="carouselImage" src="/images/carousel/4.jpg" >
            </div>
        </div>

    </div>

    <div class="carouselBackgroundDiv">
    </div>


</div>


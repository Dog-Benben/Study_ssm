<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2018/10/24
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/fore/top.jsp"%>

<script>
    var deleteOrder = false;
    var deleteOrderid = 0;

    $(function(){
        $("a[orderStatus]").click(function(){
            var orderStatus = $(this).attr("orderStatus");
            if('all'==orderStatus){
                $("table[orderStatus]").show();
            }
            else{
                $("table[orderStatus]").hide();
                $("table[orderStatus="+orderStatus+"]").show();
            }

            $("div.orderType div").removeClass("selectedOrderType");
            $(this).parent("div").addClass("selectedOrderType");
        });

        $("a.deleteOrderLink").click(function(){
            deleteOrderid = $(this).attr("orderId");
            deleteOrder = false;
            $("#deleteConfirmModal").modal("show");
        });

        $("button.deleteConfirmButton").click(function(){
            deleteOrder = true;
            $("#deleteConfirmModal").modal('hide');
        });

        $('#deleteConfirmModal').on('hidden.bs.modal', function () {
            if(deleteOrder){
                var page="foredeleteOrder";
                $.post(
                    page,
                    {"orderId":deleteOrderid},
                    function(result){
                        if("success"==result){
                            $("table.orderListItemTable[oid="+deleteOrderid+"]").hide();
                        }
                        else{
                            location.href="login.jsp";
                        }
                    }
                );
            }
        })

        $(".ask2delivery").click(function(){
            var link = $(this).attr("link");
            $(this).hide();
            page = link;
            $.ajax({
                url: page,
                success: function(result){
                    alert("???????????????????????????!")
                }
            });

        });
    });

</script>

<div class="boughtDiv">
    <div class="orderType">
        <div class="selectedOrderType"><a orderStatus="all" href="#nowhere">????????????</a></div>
        <div><a  orderStatus="waitPay" href="#nowhere">?????????</a></div>
        <div><a  orderStatus="waitDelivery" href="#nowhere">?????????</a></div>
        <div><a  orderStatus="waitConfirm" href="#nowhere">?????????</a></div>
        <div><a  orderStatus="finish" href="#nowhere">?????????</a></div>
        <div class="orderTypeLastOne" style="padding-top: 22px"><a class="noRightborder"> </a></div>
    </div>
    <div style="clear:both"></div>
    <div class="orderListTitle">
        <table class="orderListTitleTable">
            <tr>
                <td>??????</td>
                <td width="100px">??????</td>
                <td width="100px">??????</td>
                <td width="120px">?????????</td>
                <td width="100px">????????????</td>
            </tr>
        </table>
    </div>

    <div class="orderListItem">
        <c:forEach items="${orders}" var="o">
            <table class="orderListItemTable" orderStatus="${o.status}" oid="${o.id}">
                <tr class="orderListItemFirstTR">
                    <td colspan="2">
                        <b>????????????: <fmt:formatDate value="${o.create_date}" pattern="yyyy-MM-dd HH:mm:ss"/></b>
                        <span>?????????: ${o.orderCode}
					</span>
                    </td>
                    <td  colspan="3"></td>
                    </td>
                    <td class="orderItemDeleteTD">
                        <a class="deleteOrderLink" orderId="${o.id}" href="#nowhere">
                            <span  class="orderListItemDelete glyphicon glyphicon-trash"></span>
                        </a>
                    </td>
                </tr>
                <c:forEach items="${o.orderItems}" var="oi" varStatus="st">
                    <tr class="orderItemProductInfoPartTR" >
                        <td class="orderItemProductInfoPartTD"><img width="80" height="80" src="/images/productSingle_middle/${oi.product.showPicture.id}.jpg"></td>
                        <td class="orderItemProductInfoPartTD">
                            <div class="orderListItemProductLinkOutDiv">
                                <a href="foreproduct?pid=${oi.product.id}">${oi.product.name}</a>
                            </div>
                        </td>
                        <td  class="orderItemProductInfoPartTD" width="100px">

                            <div class="orderListItemProductOriginalPrice">???<fmt:formatNumber type="number" value="${oi.product.original_price}" minFractionDigits="2"/></div>
                            <div class="orderListItemProductPrice">???<fmt:formatNumber type="number" value="${oi.product.promote_price}" minFractionDigits="2"/></div>

                        </td>
                        <c:if test="${st.count==1}">
                            <td valign="top" rowspan="${fn:length(o.orderItems)}" class="orderListItemNumberTD orderItemOrderInfoPartTD" width="100px">
                                <span class="orderListItemNumber">${o.totalNumber}</span>
                            </td>
                            <td valign="top" rowspan="${fn:length(o.orderItems)}" width="120px" class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD">
                                <div class="orderListItemProductRealPrice">???<fmt:formatNumber  minFractionDigits="2"  maxFractionDigits="2" type="number" value="${o.totalPrice}"/></div>
                                <div class="orderListItemPriceWithTransport">(???????????????0.00)</div>
                            </td>
                            <td valign="top" rowspan="${fn:length(o.orderItems)}" class="orderListItemButtonTD orderItemOrderInfoPartTD" width="100px">
                                <c:if test="${o.status=='waitConfirm' }">
                                    <a href="foreconfirmPay?orderId=${o.id}">
                                        <button class="orderListItemConfirm">????????????</button>
                                    </a>
                                </c:if>
                                <c:if test="${o.status=='waitPay' }">
                                    <a href="forealipay?orderId=${o.id}&totalPrice=${o.totalPrice}">
                                        <button class="orderListItemConfirm">??????</button>
                                    </a>
                                </c:if>
                                <c:if test="${o.status=='waitDelivery' }">
                                    <span>?????????</span>
                                    <button class="btn btn-info btn-sm ask2delivery" link="#">???????????????</button>
                                </c:if>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>

            </table>
        </c:forEach>
    </div>

    <div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog" >
        <div class="modal-dialog deleteConfirmModalDiv">
            <div class="modal-content">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">??</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">???????????????</h4>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">??????</button>
                    <button class="btn btn-primary deleteConfirmButton" id="submit" type="button">??????</button>
                </div>
            </div>
        </div>
    </div>

</div>


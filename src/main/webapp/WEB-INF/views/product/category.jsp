<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/category.css?after" />
<link rel="stylesheet" href="/css/modal.css?after" />
<script src="/js/jquery.cookie.js"></script>
<script src="/js/category.js?after"></script>


<script>
    var contextPath = '${pageContext.request.contextPath}';
</script>

<!-- 본문 시작 -->
<div class="Home">
    <div class="PageWrapper">
        <div class="Padded">
            <h1 font-size="20px" class="Left-LeftPageTitle">카테고리</h1>
            <div class="Fade_Wrapper" style="opacity: 1; display: block;">
                <div class="CategoryList__Wrapper">

                    <c:forEach var="row" items="${category}">
                        <c:if test="${row.cate_large eq '아웃도어'}">
                            <a  href="#" class="CategoryItem-A" data-category="${row.cate_large}">
                                <div class="CategoryItem1">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>${row.cate_large}</span>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>

                    <c:forEach var="row" items="${category}">
                        <c:if test="${row.cate_large eq '피트니스'}">
                            <a href="#" class="CategoryItem-A" data-category="${row.cate_large}">
                                <div class="CategoryItem2">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>${row.cate_large}</span>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>

                    <c:forEach var="row" items="${category}">
                        <c:if test="${row.cate_large eq '공예DIY'}">
                            <a href="#" class="CategoryItem-A" data-category="${row.cate_large}">
                                <div class="CategoryItem3">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>${row.cate_large}</span>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>

                    <c:forEach var="row" items="${category}">
                        <c:if test="${row.cate_large eq '스포츠'}">
                            <a href="#" class="CategoryItem-A" data-category="${row.cate_large}">
                                <div class="CategoryItem4">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>${row.cate_large}</span>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>

                    <c:forEach var="row" items="${category}">
                        <c:if test="${row.cate_large eq '베이킹'}">
                            <a href="#" class="CategoryItem-A" data-category="${row.cate_large}">
                                <div class="CategoryItem5">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span >${row.cate_large}</span>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>

                    <c:forEach var="row" items="${category}">
                        <c:if test="${row.cate_large eq '문화예술'}">
                            <a href="#" class="CategoryItem-A" data-category="${row.cate_large}">
                                <div class="CategoryItem6">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>${row.cate_large}</span>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>

                    <a href="#" class="CategoryItem-A" data-category="온라인">
                        <div class="CategoryItem7">
                            <div class="CategoryItem__Background"></div>
                            <div class="CategoryItem__Text"></div>
                            <span>온라인</span>
                        </div>
                    </a>

                    <c:forEach var="row" items="${category}">
                        <c:if test="${row.cate_large eq '자기계발'}">
                            <a href="#" class="CategoryItem-A" data-category="${row.cate_large}">
                                <div class="CategoryItem8">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>${row.cate_large}</span>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>

                    <a href="#" class="CategoryItem-A" data-category="뷰티">
                        <div class="CategoryItem9">
                            <div class="CategoryItem__Background"></div>
                            <div class="CategoryItem__Text"></div>
                            <span>뷰티</span>
                        </div>
                    </a>

                    <a href="#" class="CategoryItem-A" data-category="모임">
                        <div class="CategoryItem10">
                            <div class="CategoryItem__Background"></div>
                            <div class="CategoryItem__Text"></div>
                            <span>모임</span>
                        </div>
                    </a>

                    <a href="#" class="CategoryItem-A" data-category="스토어">
                        <div class="CategoryItem11">
                            <div class="CategoryItem__Background"></div>
                            <div class="CategoryItem__Text"></div>
                            <span>스토어</span>
                        </div>
                    </a>

                    <c:forEach var="row" items="${category}">
                        <c:if test="${row.cate_large eq '상담'}">
                            <a href="#" class="CategoryItem-A" data-category="${row.cate_large}">
                                <div class="CategoryItem12">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>${row.cate_large}</span>
                                </div>
                            </a>
                        </c:if>
                    </c:forEach>


                    <a href="#" class="CategoryItem-A" data-category="수상레포츠">
                        <div class="CategoryItem13">
                            <div class="CategoryItem__Background"></div>
                            <div class="CategoryItem__Text"></div>
                            <span>수상레포츠</span>
                        </div>
                    </a>

                    <a href="#" class="CategoryItem-A" data-category="음료">
                        <div class="CategoryItem14">
                            <div class="CategoryItem__Background"></div>
                            <div class="CategoryItem__Text"></div>
                            <span>음료</span>
                        </div>
                    </a>

                    <a href="#" class="CategoryItem-A" data-category="요리">
                        <div class="CategoryItem15">
                            <div class="CategoryItem__Background"></div>
                            <div class="CategoryItem__Text"></div>
                            <span>요리</span>
                        </div>
                    </a>

                    <a href="#" class="CategoryItem-A" data-category="국내여행">
                        <div class="CategoryItem16">
                            <div class="CategoryItem__Background"></div>
                            <div class="CategoryItem__Text"></div>
                            <span>국내여행</span>
                        </div>
                    </a>

                    <a href="#" class="CategoryItem-A" data-category="제주여행">
                        <div class="CategoryItem17">
                            <div class="CategoryItem__Background"></div>
                            <div class="CategoryItem__Text"></div>
                            <span>제주여행</span>
                        </div>
                    </a>

                    <a href="#" class="CategoryItem-A" data-category="해외여행">
                        <div class="CategoryItem18">
                            <div class="CategoryItem__Background"></div>
                            <div class="CategoryItem__Text"></div>
                            <span>해외여행</span>
                        </div>
                    </a>



                </div>
            </div>
        </div>
        <br>
        <br>
    </div>
</div>


<!-- 본문 끝 -->


<%@include file="../footer.jsp"%>
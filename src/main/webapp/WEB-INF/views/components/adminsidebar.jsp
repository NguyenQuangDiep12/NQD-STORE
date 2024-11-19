<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <!-- Title -->
    <c:set var="editProduct" value="Thêm, Sửa, Xóa Game"/>
    <c:set var="userManagement" value="Quản lý người dùng"/>
    <c:set var="orderManagement" value="Quản lý đơn hàng"/>
    <c:set var="WebContentManagement" value="Quản lý nội dung website"/>
    <c:set var="ManageReviewComment" value="Quản lý đánh giá và bình luận"/>
    <c:set var="ManageVoucherPromotions" value="Quản lý voucher và khuyến mãi"/>
    <c:set var="CustomerSupport" value="Hỗ trợ khách hàng"/>
    <c:set var="FinancialManagement" value="Quản lý tài chính"/>
    <!-- Tien ich -->

    <!-- End Title -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/admin/dashboard">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
        </a>
    
        <!-- Divider -->
        <hr class="sidebar-divider my-0">
    
        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <!-- Reload Dashboard -->
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>
    
        <!-- Divider -->
        <hr class="sidebar-divider">
    
        <!-- Heading -->
        <div class="sidebar-heading">
            Quản Lý Sản Phẩm
        </div>
    
        <!-- Quan ly san pham -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProduct"
                aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span title="Thêm, Sửa, Xóa Game">
                    <c:choose>
                        <c:when test="${fn:length(editProduct) > 15}">
                            ${fn:substring(editProduct, 0, 15)}...
                        </c:when>
                        <c:otherwise>
                            ${editProduct}
                        </c:otherwise>
                    </c:choose>
                </span>
            </a>
            <div id="collapseProduct" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/edit-product">Thêm sửa xóa sản phẩm</a>
                    <a class="collapse-item" href="#discount">Khuyến mãi và giảm giá</a>
                </div>
            </div>
        </li>
    
        <!-- Quan ly nguoi dung -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUser"
                aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-wrench"></i>
                <span title="Quản lý người dùng">
                    <c:choose>
                        <c:when test="${fn:length(userManagement) > 15}">
                            ${fn:substring(userManagement, 0, 15)}...
                        </c:when>
                        <c:otherwise>
                            ${userManagement}
                        </c:otherwise>
                    </c:choose>
                </span>
            </a>
            <div id="collapseUser" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="#view-users">Xem danh sách người dùng</a>
                    <a class="collapse-item" href="#edit-users">Sửa thông tin người dùng</a>
                    <a class="collapse-item" href="user-transaction">Lịch sử giao dịch</a>
                    <a class="collapse-item" href="#">Other</a>
                </div>
            </div>
        </li>
        <!-- Quan ly don hang -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseOrder"
                aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span title="Quản lý đơn hàng">
                    <c:choose>
                        <c:when test="${fn:length(orderManagement) > 15}">
                            ${fn:substring(orderManagement, 0, 15)}...
                        </c:when>
                        <c:otherwise>
                            ${orderManagement}
                        </c:otherwise>
                    </c:choose>
                </span>
            </a>
            <div id="collapseOrder" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="#view-users">Danh sách đơn hàng</a>
                    <a class="collapse-item" href="#edit-users">Hoàn tiền và hủy đơn</a>
                    <a class="collapse-item" href="#">Other</a>
                </div>
            </div>
        </li>
        <!-- Quan ly noi dung website -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseContent"
                aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span title="Quản lý nội dung website">
                    <c:choose>
                        <c:when test="${fn:length(WebContentManagement) > 15}">
                            ${fn:substring(WebContentManagement, 0, 15)}...
                        </c:when>
                        <c:otherwise>
                            ${WebContentManagement}
                        </c:otherwise>
                    </c:choose>
                </span>
            </a>
            <div id="collapseContent" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="#view-users">Tin tức và thông báo</a>
                    <a class="collapse-item" href="#edit-users">Banner và sự kiện</a>
                    <a class="collapse-item" href="#">Other</a>
                </div>
            </div>
        </li>
        <!-- Quan ly danh gia va binh luan -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseEvaluate"
                aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span title="Quan ly danh gia va binh luan">
                    <c:choose>
                        <c:when test="${fn:length(ManageReviewComment) > 15}">
                            ${fn:substring(ManageReviewComment, 0, 15)}...
                        </c:when>
                        <c:otherwise>
                            ${ManageReviewComment}
                        </c:otherwise>
                    </c:choose>
                </span>
            </a>
            <div id="collapseEvaluate" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="#view-users">Kiểm duyệt bình luận</a>
                    <a class="collapse-item" href="#edit-users">Phản hồi đánh giá</a>
                    <a class="collapse-item" href="#">Other</a>
                </div>
            </div>
        </li>
        <!-- Quan ly voucher va khuyen mai -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseVoucher"
                aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span title="Quan ly voucher va khuyen mai ">
                    <c:choose>
                        <c:when test="${fn:length(ManageVoucherPromotions) > 15}">
                            ${fn:substring(ManageVoucherPromotions, 0, 15)}...
                        </c:when>
                        <c:otherwise>
                            ${ManageVoucherPromotions}
                        </c:otherwise>
                    </c:choose>
                </span>
            </a>
            <div id="collapseVoucher" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="#view-users">Tạo mã giảm giá</a>
                    <a class="collapse-item" href="#edit-users">Quản lý khuyến Mãi</a>
                    <a class="collapse-item" href="#">Other</a>
                </div>
            </div>
        </li>
        <!-- Ho tro khach hang -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSupport"
                aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span title="Ho tro khach hang">
                    <c:choose>
                        <c:when test="${fn:length(CustomerSupport) > 15}">
                            ${fn:substring(CustomerSupport, 0, 15)}...
                        </c:when>
                        <c:otherwise>
                            ${CustomerSupport}
                        </c:otherwise>
                    </c:choose>
                </span>
            </a>
            <div id="collapseSupport" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="#view-users">Ticket hỗ trợ</a>
                    <a class="collapse-item" href="#edit-users">Câu hỏi và thắc mắc</a>
                    <a class="collapse-item" href="#">Other</a>
                </div>
            </div>
        </li>
        <!-- Quan ly tai chinh -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseFinance"
                aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span title="Quan ly tai chinh">
                    <c:choose>
                        <c:when test="${fn:length(FinancialManagement) > 15}">
                            ${fn:substring(FinancialManagement, 0, 15)}...
                        </c:when>
                        <c:otherwise>
                            ${FinancialManagement}
                        </c:otherwise>
                    </c:choose>
                </span>
            </a>
            <div id="collapseFinance" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="#view-users">Lịch sử thanh toán</a>
                    <a class="collapse-item" href="#edit-users">Phí giao dịch và hoàn tiền</a>
                    <a class="collapse-item" href="#">Other</a>
                </div>
            </div>
        </li>
    
    
        <!-- Divider -->
        <hr class="sidebar-divider">
    
        <!-- Heading -->
        <div class="sidebar-heading">
            Tiện ích
        </div>
    
        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>Pages</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Login Screens:</h6>
                    <a class="collapse-item" href="login.html">Login</a>
                    <a class="collapse-item" href="register.html">Register</a>
                    <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                    <div class="collapse-divider"></div>
                    <h6 class="collapse-header">Other Pages:</h6>
                    <a class="collapse-item" href="404.html">404 Page</a>
                    <a class="collapse-item" href="blank.html">Blank Page</a>
                </div>
            </div>
        </li>
    
        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Charts</span></a>
        </li>
    
        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="tables.html">
                <i class="fas fa-fw fa-table"></i>
                <span>Tables</span></a>
        </li>
    
        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">
    
        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    
    </ul>    
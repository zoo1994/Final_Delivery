<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-1 col-lg-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">점포 관리</span>
                </a>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                     <li>
                        <a href="#submenu1"  class="nav-link px-0 align-middle title">
                            <span class="material-symbols-outlined">storefront</span><span class="ms-1 d-none d-sm-inline">가게</span> </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;전체현황</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;가게관리</span></a>
                            </li>
                             <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;영업임시중지</span></a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#submenu2"  class="nav-link px-0 align-middle title">
                            <span class="material-symbols-outlined">assignment</span><span class="ms-1 d-none d-sm-inline">메뉴</span> </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;메뉴관리</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;품질설정</span></a>
                            </li>
                        </ul>
                    </li>
                   	
                   	<li>
                        <a href="#submenu3"  class="nav-link px-0 align-middle title">
                            <span class="material-symbols-outlined">request_quote</span><span class="ms-1 d-none d-sm-inline">주문정산</span> </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu3" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;주문내역</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">&nbsp;&nbsp;정산내역</span></a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#" class="nav-link px-0 align-middle title">
                        <span class="material-symbols-outlined">monitoring</span><span class="ms-1 d-none d-sm-inline">통계</span></a>
                    </li>
                    
                    
                  
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
                        <span class="d-none d-sm-inline mx-1">ㅁㅁㅁ</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                        <li><a class="dropdown-item" href="#">New project...</a></li>
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Sign out</a></li>
                    </ul>
                </div>
            </div>
        </div>
        </div>
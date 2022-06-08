<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin-top: 200px;"></div>


    <header>
        <h1>검색하기</h1>
        <input class="keyword" autocomplete="off" />
    </header>
    <div class="keywords" id="keywords">

    </div>
    <div class="search-results">
        <table border=1>
            <tr>
                <th width="120px" height="50px">가</th>
                <th width="120px" height="50px">나</th>
                <th width="120px" height="50px">다</th>
                <th width="120px" height="50px">라</th>
                <th width="120px" height="50px">마</th>
            </tr>
        </table>
    </div>
	




<div>
    <table width="600" cellpadding="0" cellspacing="0" border="0" style=" margin: 0 auto; background-color: #f3f3f3;">			
        <tbody>
            <tr>
                <td align="left" colspan="3" height="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="1" height="1" style="display: block; border:none;" loading="lazy"></td>
            </tr>
            <tr>
                <td align="left" width="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="14" style="display: block; border:none;" loading="lazy"></td>
                <td align="left" width="572">
                    <table width="572" cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                            <tr>
                                <td align="left" height="75" style="background:#3d3d3d;"><img src="https://www.mcdelivery.co.kr/edm/82/logo_ko.png" height="75" style="display: block; border:none;" alt="McDelivery™" loading="lazy"></td><td height="75" width="572" style="background:#3d3d3d; color:#ffffff; font-family: Helvetica, Arial, sans-serif; font-size: 22px; font-weight: bold; padding:0 20px;">맥딜리버리에 가입하셨습니다</td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
                                    <table width="572" cellpadding="0" cellspacing="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td align="left" width="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="25" style="display: block; border:none;" loading="lazy"></td>
                                                <td align="left" width="522">
                                                    <table width="522" cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                        <tr>
                                                            <td align="left" height="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="40" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: #000001; font-size: 20px; font-family: Helvetica, Arial, sans-serif;">문종하 고객님,<br>환영합니다!</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="15"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: #000001; font-size: 14px; font-family: Helvetica, Arial, sans-serif; line-height: 20px;">
                                                                맥딜리버리 사이트에 가입해 주셔서 감사합니다. 신규 가입자 분들께 다음과 같은 혜택이 제공됩니다:<br><br>
                                                                1. 신제품 소식 및 프로모션 안내 메일 발송.<br>2. 빠르고 간편한 결제.<br>3. 선호 메뉴 등록 후 빠른 재주문.<br><br>
                                                                사용자명: 3477qq@naver.com<br>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="30"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="30" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="25"><a style="font-size: 14px; font-family: Helvetica, Arial, sans-serif;" href="http://localhost/" target="_blank" rel="noreferrer noopener"><img src="https://ifh.cc/g/vQ8ZaX.png" style="display: block; border:none; border-radius: 5px;" alt="딜리버리 바로가기" loading="lazy"></a></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: #000001; font-size: 14px; font-family: Helvetica, Arial, sans-serif; line-height: 20px;">감사합니다,<br>맥딜리버리 팀.</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="25" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr style="vertical-align: top;">
                                                            <td style="padding: 25px 0 0 0; border-top: 1px dashed #a2a1a1;">
                                                            <img src="https://www.mcdelivery.co.kr/edm/82/banner_ko.png" width="522" height="159" style="display: block; border:none;" alt="McDelivery Promotions" loading="lazy">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="10" style="display: block; border:none;" loading="lazy"></td>
                                                            </tr>
                                                        <tr>
                                                            <td style="font-family: Helvetica, Arial, sans-serif; font-size: 10px; color: #000001; font-family: Helvetica, Arial, sans-serif;">본 메일은 발신 전용 메일이므로 회신이 불가능합니다.</td>
                                                            </tr>
                                                        <tr>
                                                            <td align="left" height="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="10" style="display: block; border:none;" loading="lazy"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td align="left" width="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="25" style="display: block; border:none;" loading="lazy"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
            </td>
            <td align="left" width="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="14" style="display: block; border:none;" loading="lazy"></td>
            </tr>						
            <tr>
                <td colspan="3" style="background-color: #3d3d3d;">
                    <table cellpadding="0" cellspacing="0" border="0" width="600">
                        <tbody>
                            <tr>
                                <td colspan="5" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td>
                            </tr>
                            <tr>
                                <td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td>
                                <td width="358" style="font-size: 10px; color: #ffffff; font-family: Helvetica, Arial, sans-serif;">
                                    <a style="color: #ffffff; text-decoration: none;" href="https://www.mcdelivery.co.kr/kr/support-tnc.html" target="_blank" rel="noreferrer noopener">이용약관</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="https://www.mcdelivery.co.kr/kr/support-privacy.html?locale=ko" target="_blank" rel="noreferrer noopener">개인정보 처리방침</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="http://localhost/faq/list" target="_blank" rel="noreferrer noopener">자주 묻는 질문</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="http://www.mcdonalds.co.kr/kor/news/detail.do?page=1&amp;seq=517&amp;rnum=1&amp;temp_seq=&amp;searchWord=" target="_blank" rel="noreferrer noopener">과일 칠러 판매 제외 매장</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="http://www.mcdonalds.co.kr/uploadFolder/page/p_menu.jsp" target="_blank" rel="noreferrer noopener">영양정보/원산지 정보/기타 정보</a>
                                </td>
                                <td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td>
                                <td width="122" style="font-size: 10px; color: #ffffff; font-family: Helvetica, Arial, sans-serif;">팔로우:
                                    <table cellpadding="0" cellspacing="0" border="0" width="122">
                                        <tbody>
                                            <tr>
                                                <td><a style="text-decoration: none;" href="https://www.facebook.com/McDonaldsKorea" target="_blank" rel="noreferrer noopener"><img src="https://www.mcdelivery.co.kr/edm/82/icon-fb.png" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td>
                                                <td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td>
                                                <td><a style="text-decoration: none;" href="https://instagram.com/McDonalds_kr" target="_blank" rel="noreferrer noopener"><img src="https://upload.wikimedia.org/wikipedia/commons/e/e7/Instagram_logo_2016.svg" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td>
                                                <td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td>
                                                <td><a style="text-decoration: none;" href="https://www.youtube.com/user/McDonaldsKor" target="_blank" rel="noreferrer noopener"> <img src="https://www.mcdelivery.co.kr/edm/82/icon-yt.png" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td>
                                                <td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td>
                                                <td><img width="23" height="24" style="display: block; border:none;" src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" loading="lazy"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td>
                            </tr>
                            <tr>
                                <td colspan="5" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>                           
            <tr>
                <td colspan="3" height="15" style="background-color: #ffffff;"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td>
            </tr>
            <tr>
                <td colspan="3" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px; color: #000001; text-align: center; background:#ffffff; text-transform:uppercase;">Copyright © 2014 All Rights Reserved By McDonald's™<br>The Golden Arches Logo and "i'm lovin' it" are trademarks of <br>McDonald's Corporation and its affiliates.</td></tr>
            <tr>
                <td colspan="3" height="15" style="background-color: #ffffff;"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td>
            </tr>
        </tbody>
    </table>
</div>












<hr><hr><hr><hr>
<div>hh</div>











<div>
    <table width="600" cellpadding="0" cellspacing="0" border="0" style=" margin: 0 auto; background-color: #f3f3f3;">			
        <tbody>
            <tr>
                <td align="left" colspan="3" height="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="1" height="1" style="display: block; border:none;" loading="lazy"></td>
            </tr>
            <tr>
                <td align="left" width="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="14" style="display: block; border:none;" loading="lazy"></td>
                <td align="left" width="572">
                    <table width="572" cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                            <tr>
                                <td align="left" height="75" style="background:#3d3d3d;"><img src="https://www.mcdelivery.co.kr/edm/82/logo_ko.png" height="75" style="display: block; border:none;" alt="McDelivery™" loading="lazy"></td><td height="75" width="572" style="background:#3d3d3d; color:#ffffff; font-family: Helvetica, Arial, sans-serif; font-size: 22px; font-weight: bold; padding:0 20px;">맥딜리버리 특별 혜택 안내</td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
                                    <table width="572" cellpadding="0" cellspacing="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td align="left" width="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="25" style="display: block; border:none;" loading="lazy"></td>
                                                <td align="left" width="522">
                                                    <table width="522" cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                        <tr>
                                                            <td align="left" height="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="40" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: #000001; font-size: 20px; font-family: Helvetica, Arial, sans-serif;">안녕하세요<br>문종하 고객님!</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="15"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: #000001; font-size: 14px; font-family: Helvetica, Arial, sans-serif; line-height: 20px;">
                                                                맥딜리버리 사이트에 이용해 주셔서 감사합니다. 기존 가입자 분들께 혜택을 안내해드리고자 합니다.<br><br>
                                                                1. 신제품 소식 및 프로모션 안내 메일 발송.<br>                                                          
                                                                <br><br>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="30"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="30" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="25"><a style="font-size: 14px; font-family: Helvetica, Arial, sans-serif;" href="http://localhost/event/list" target="_blank" rel="noreferrer noopener"><img src="https://ifh.cc/g/aabMbt.png" style="display: block; border:none; border-radius: 5px;" alt="쿠폰 발급 바로가기" loading="lazy"></a></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: #000001; font-size: 14px; font-family: Helvetica, Arial, sans-serif; line-height: 20px;">감사합니다,<br>맥딜리버리 팀.</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="25" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr style="vertical-align: top;">
                                                            <td style="padding: 25px 0 0 0; border-top: 1px dashed #a2a1a1;">
                                                            <img src="https://www.mcdelivery.co.kr/edm/82/banner_ko.png" width="522" height="159" style="display: block; border:none;" alt="McDelivery Promotions" loading="lazy">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="10" style="display: block; border:none;" loading="lazy"></td>
                                                            </tr>
                                                        <tr>
                                                            <td style="font-family: Helvetica, Arial, sans-serif; font-size: 10px; color: #000001; font-family: Helvetica, Arial, sans-serif;">본 메일은 발신 전용 메일이므로 회신이 불가능합니다.</td>
                                                            </tr>
                                                        <tr>
                                                            <td align="left" height="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="10" style="display: block; border:none;" loading="lazy"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td align="left" width="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="25" style="display: block; border:none;" loading="lazy"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
            </td>
            <td align="left" width="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="14" style="display: block; border:none;" loading="lazy"></td>
            </tr>						
            <tr>
                <td colspan="3" style="background-color: #3d3d3d;">
                    <table cellpadding="0" cellspacing="0" border="0" width="600">
                        <tbody>
                            <tr>
                                <td colspan="5" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td>
                            </tr>
                            <tr>
                                <td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td>
                                <td width="358" style="font-size: 10px; color: #ffffff; font-family: Helvetica, Arial, sans-serif;">
                                    <a style="color: #ffffff; text-decoration: none;" href="https://www.mcdelivery.co.kr/kr/support-tnc.html" target="_blank" rel="noreferrer noopener">이용약관</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="https://www.mcdelivery.co.kr/kr/support-privacy.html?locale=ko" target="_blank" rel="noreferrer noopener">개인정보 처리방침</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="http://localhost/faq/list" target="_blank" rel="noreferrer noopener">자주 묻는 질문</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="http://www.mcdonalds.co.kr/kor/news/detail.do?page=1&amp;seq=517&amp;rnum=1&amp;temp_seq=&amp;searchWord=" target="_blank" rel="noreferrer noopener">과일 칠러 판매 제외 매장</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="http://www.mcdonalds.co.kr/uploadFolder/page/p_menu.jsp" target="_blank" rel="noreferrer noopener">영양정보/원산지 정보/기타 정보</a>
                                    
                                </td>
                                <td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td>
                                <td width="122" style="font-size: 10px; color: #ffffff; font-family: Helvetica, Arial, sans-serif;">팔로우:
                                    <table cellpadding="0" cellspacing="0" border="0" width="122">
                                        <tbody>
                                            <tr>
                                                <td><a style="text-decoration: none;" href="https://www.facebook.com/McDonaldsKorea" target="_blank" rel="noreferrer noopener"><img src="https://www.mcdelivery.co.kr/edm/82/icon-fb.png" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td>
                                                <td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td>
                                                <td><a style="text-decoration: none;" href="https://instagram.com/McDonalds_kr" target="_blank" rel="noreferrer noopener"><img src="https://upload.wikimedia.org/wikipedia/commons/e/e7/Instagram_logo_2016.svg" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td>
                                                <td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td>
                                                <td><a style="text-decoration: none;" href="https://www.youtube.com/user/McDonaldsKor" target="_blank" rel="noreferrer noopener"> <img src="https://www.mcdelivery.co.kr/edm/82/icon-yt.png" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td>
                                                <td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td>
                                                <td><img width="23" height="24" style="display: block; border:none;" src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" loading="lazy"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td>
                            </tr>
                            <tr>
                                <td colspan="5" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>                           
            <tr>
                <td colspan="3" height="15" style="background-color: #ffffff;"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td>
            </tr>
            <tr>
                <td colspan="3" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px; color: #000001; text-align: center; background:#ffffff; text-transform:uppercase;">Copyright © 2014 All Rights Reserved By McDonald's™<br>The Golden Arches Logo and "i'm lovin' it" are trademarks of <br>McDonald's Corporation and its affiliates.</td></tr>
            <tr>
                <td colspan="3" height="15" style="background-color: #ffffff;"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td>
            </tr>
        </tbody>
    </table>
</div>


<hr><hr><hr><hr>
<div>hh</div>











<div>
    <table width="600" cellpadding="0" cellspacing="0" border="0" style=" margin: 0 auto; background-color: #f3f3f3;">			
        <tbody>
            <tr>
                <td align="left" colspan="3" height="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="1" height="1" style="display: block; border:none;" loading="lazy"></td>
            </tr>
            <tr>
                <td align="left" width="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="14" style="display: block; border:none;" loading="lazy"></td>
                <td align="left" width="572">
                    <table width="572" cellpadding="0" cellspacing="0" border="0">
                        <tbody>
                            <tr>
                                <td align="left" height="75" style="background:#3d3d3d;"><img src="https://www.mcdelivery.co.kr/edm/82/logo_ko.png" height="75" style="display: block; border:none;" alt="McDelivery™" loading="lazy"></td><td height="75" width="572" style="background:#3d3d3d; color:#ffffff; font-family: Helvetica, Arial, sans-serif; font-size: 22px; font-weight: bold; padding:0 20px;">맥딜리버리 특별 혜택 안내</td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2">
                                    <table width="572" cellpadding="0" cellspacing="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td align="left" width="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="25" style="display: block; border:none;" loading="lazy"></td>
                                                <td align="left" width="522">
                                                    <table width="522" cellpadding="0" cellspacing="0" border="0">
                                                        <tbody>
                                                        <tr>
                                                            <td align="left" height="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="40" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: #000001; font-size: 20px; font-family: Helvetica, Arial, sans-serif;">안녕하세요<br>문종하 고객님!</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="15"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: #000001; font-size: 14px; font-family: Helvetica, Arial, sans-serif; line-height: 20px;">
                                                                맥딜리버리 사이트에 이용해 주셔서 감사합니다. 기존 가입자 분들께 혜택을 제공해드리고자 합니다.<br><br>
                                                                쿠폰코드 : ZHC157LS                                                         
                                                                <br><br>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="30"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="30" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td height="25"><a style="font-size: 14px; font-family: Helvetica, Arial, sans-serif;" href="http://localhost/member/cpRegister" target="_blank" rel="noreferrer noopener"><img src="https://ifh.cc/g/tpoYol.png" style="display: block; border:none; border-radius: 5px;" alt="쿠폰 등록 바로가기" loading="lazy"></a></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: #000001; font-size: 14px; font-family: Helvetica, Arial, sans-serif; line-height: 20px;">감사합니다,<br>맥딜리버리 팀.</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="25" style="display: block; border:none;" loading="lazy"></td>
                                                        </tr>
                                                        <tr style="vertical-align: top;">
                                                            <td style="padding: 25px 0 0 0; border-top: 1px dashed #a2a1a1;">
                                                            <img src="https://www.mcdelivery.co.kr/edm/82/banner_ko.png" width="522" height="159" style="display: block; border:none;" alt="McDelivery Promotions" loading="lazy">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" height="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="10" style="display: block; border:none;" loading="lazy"></td>
                                                            </tr>
                                                        <tr>
                                                            <td style="font-family: Helvetica, Arial, sans-serif; font-size: 10px; color: #000001; font-family: Helvetica, Arial, sans-serif;">본 메일은 발신 전용 메일이므로 회신이 불가능합니다.</td>
                                                            </tr>
                                                        <tr>
                                                            <td align="left" height="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="10" style="display: block; border:none;" loading="lazy"></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                                <td align="left" width="25"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="25" style="display: block; border:none;" loading="lazy"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
            </td>
            <td align="left" width="14"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="14" style="display: block; border:none;" loading="lazy"></td>
            </tr>						
            <tr>
                <td colspan="3" style="background-color: #3d3d3d;">
                    <table cellpadding="0" cellspacing="0" border="0" width="600">
                        <tbody>
                            <tr>
                                <td colspan="5" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td>
                            </tr>
                            <tr>
                                <td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td>
                                <td width="358" style="font-size: 10px; color: #ffffff; font-family: Helvetica, Arial, sans-serif;">
                                    <a style="color: #ffffff; text-decoration: none;" href="https://www.mcdelivery.co.kr/kr/support-tnc.html" target="_blank" rel="noreferrer noopener">이용약관</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="https://www.mcdelivery.co.kr/kr/support-privacy.html?locale=ko" target="_blank" rel="noreferrer noopener">개인정보 처리방침</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="http://localhost/faq/list" target="_blank" rel="noreferrer noopener">자주 묻는 질문</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="http://www.mcdonalds.co.kr/kor/news/detail.do?page=1&amp;seq=517&amp;rnum=1&amp;temp_seq=&amp;searchWord=" target="_blank" rel="noreferrer noopener">과일 칠러 판매 제외 매장</a>
                                    | <a style="color: #ffffff; text-decoration: none;" href="http://www.mcdonalds.co.kr/uploadFolder/page/p_menu.jsp" target="_blank" rel="noreferrer noopener">영양정보/원산지 정보/기타 정보</a>
                                    
                                </td>
                                <td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td>
                                <td width="122" style="font-size: 10px; color: #ffffff; font-family: Helvetica, Arial, sans-serif;">팔로우:
                                    <table cellpadding="0" cellspacing="0" border="0" width="122">
                                        <tbody>
                                            <tr>
                                                <td><a style="text-decoration: none;" href="https://www.facebook.com/McDonaldsKorea" target="_blank" rel="noreferrer noopener"><img src="https://www.mcdelivery.co.kr/edm/82/icon-fb.png" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td>
                                                <td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td>
                                                <td><a style="text-decoration: none;" href="https://instagram.com/McDonalds_kr" target="_blank" rel="noreferrer noopener"><img src="https://upload.wikimedia.org/wikipedia/commons/e/e7/Instagram_logo_2016.svg" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td>
                                                <td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td>
                                                <td><a style="text-decoration: none;" href="https://www.youtube.com/user/McDonaldsKor" target="_blank" rel="noreferrer noopener"> <img src="https://www.mcdelivery.co.kr/edm/82/icon-yt.png" width="23" height="24" style="display: block; border:none;" loading="lazy"></a></td>
                                                <td width="10"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="10" style="display: block; border:none;" loading="lazy"></td>
                                                <td><img width="23" height="24" style="display: block; border:none;" src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" loading="lazy"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td width="40"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" width="40" style="display: block; border:none;" loading="lazy"></td>
                            </tr>
                            <tr>
                                <td colspan="5" height="20"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="20" style="display: block; border:none;" loading="lazy"></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>                           
            <tr>
                <td colspan="3" height="15" style="background-color: #ffffff;"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td>
            </tr>
            <tr>
                <td colspan="3" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px; color: #000001; text-align: center; background:#ffffff; text-transform:uppercase;">Copyright © 2014 All Rights Reserved By McDonald's™<br>The Golden Arches Logo and "i'm lovin' it" are trademarks of <br>McDonald's Corporation and its affiliates.</td></tr>
            <tr>
                <td colspan="3" height="15" style="background-color: #ffffff;"><img src="https://www.mcdelivery.co.kr/edm/82/spacer.gif" height="15" style="display: block; border:none;" loading="lazy"></td>
            </tr>
        </tbody>
    </table>
</div>

<c:import url="../temp/footer.jsp"></c:import>
<script src="../resources/js/footerNoMargin.js"></script>
</body>
</html>
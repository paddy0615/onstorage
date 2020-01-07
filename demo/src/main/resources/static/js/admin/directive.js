var myapp = angular.module("myapp",[]);
// 路由
myapp.config(['$locationProvider', function($locationProvider) {
    // $locationProvider.html5Mode(true);
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
}]);
// 左导航  <left-Directive></left-Directive>
myapp.directive('leftDirective', function() {
    var templateHtml = " <div class=\"col-sm-3 col-md-2 sidebar\">" +
        "                <ul class=\"nav nav-sidebar\" id=\"side-menu\">\n" +
        "                <li class=\"languagePage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/language')\">Language Maintenance</a></li>\n" +
        "                <li class=\"folderPage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/folder')\">Folder Category</a></li>\n" +
        "                <li class=\"faqOnePage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/faqOne')\">FAQ Library</a></li>\n" +
        "                <li class=\"faqTwoPage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/faqTwo')\">Question List</a></li>\n" +
        "                        <li>\n" +
        "                            <a href=\"#\"><i class=\"fa fa-sitemap fa-fw\"></i>FAQ Feedback<span class=\"glyphicon glyphicon-test\"></span></a>\n" +
        "                            <ul class=\"nav nav-second-level navbartop2\">\n" +
        "                                <li  class=\"selectfeedbackPage\">\n" +
        "                                    <a href='javascript:void(0);' ng-click=\"goCancel('" + ctx + "appPage/admin/selectFeedback')\"> &nbsp;&nbsp;&nbsp;&nbsp;Search Feedback</a>\n" +
        "                                </li>\n" +
        "                                <li  class=\"feedbackPage\" >\n" +
        "                                   <a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/feedback')\"> &nbsp;&nbsp;&nbsp;&nbsp;Question Feedback</a>"+
        "                                </li>\n" +
        "                            </ul>\n" +
        "                        </li>\n" +
        "                        <li>\n" +
        "                            <a href=\"#\"><i class=\"fa fa-sitemap fa-fw\"></i>Search For<span class=\"glyphicon glyphicon-test\"></span></a>\n" +
        "                            <ul class=\"nav nav-second-level navbartop3\">\n" +
        "                                <li  class=\"searchCollectionPage\">\n" +
        "                                    <a href='javascript:void(0);' ng-click=\"goCancel('" + ctx + "appPage/admin/searchCollection')\"> &nbsp;&nbsp;&nbsp;&nbsp;Search Collection</a>\n" +
        "                                </li>\n" +
        "                                <li  class=\"notagsPage\" >\n" +
        "                                   <a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/notags')\"> &nbsp;&nbsp;&nbsp;&nbsp;No Result Key Words</a>"+
        "                                </li>\n" +
        "                            </ul>\n" +
        "                        </li>\n" +
        "                <li class=\"reportPage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/report')\">Report</a></li>\n" +
        "            </ul></div>";
    return {
        restrict: 'E',
        template: templateHtml
    }
});

// 头部
var faqRole = "";
myapp.directive('topDirective', function() {
    // 后台获取
    (function(){
        // 直线在HTML 标签添加zg-access="access"
        $.ajax({
            type:"post",
            url:ctx + "appJson/admin/getUser",
            async : false,
            success:function(data){
                faqRole = data;
            }
        });
    })();
    var templateHtml = "<nav class=\"navbar navbar-inverse navbar-fixed-top\">\n" +
        "    <div class=\"container-fluid\">\n" +
        "        <div class=\"navbar-header\" style='width: 100%'>\n" +
        "            <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#navbar\" aria-expanded=\"false\" aria-controls=\"navbar\">\n" +
        "                <span class=\"sr-only\">Toggle navigation</span>\n" +
        "                <span class=\"icon-bar\"></span>\n" +
        "                <span class=\"icon-bar\"></span>\n" +
        "                <span class=\"icon-bar\"></span>\n" +
        "            </button>\n" +
        "            <a class=\"navbar-brand\" href=\"#\">FAQs - <span class='faqRoleTest'>"+faqRole+"</span></a>\n" +
        "            <a class=\"navbar-brand navbar-right\" href=\"javascript:void(0);\"  ng-click=\"goCancel('" + ctx + "appJson/admin/logOut')\"><span class=\"glyphicon glyphicon-log-out\"></span>log-out</a>\n" +
        "        </div>\n" +
        "        <div id=\"navbar\" class=\"navbar-collapse collapse\">\n" +
        "            <ul id=\"topTest-hide\" class=\"nav navbar-nav navbar-right\">\n" +
        "                <li class=\"languagePage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/language')\">Language Maintenance</a></li>\n" +
        "                <li class=\"folderPage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/folder')\">Folder Category</a></li>\n" +
        "                <li class=\"faqOnePage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/faqOne')\">FAQ Library</a></li>\n" +
        "                <li class=\"faqTwoPage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/faqTwo')\">Question List</a></li>\n" +
        "                <li class=\"feedbackPage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/feedback')\">FAQ Feedback</a></li>\n" +
        "                        <li>\n" +
        "                            <a href=\"#\"><i class=\"fa fa-sitemap fa-fw\"></i>FAQ Feedback<span class=\"glyphicon glyphicon-test\"></span></a>\n" +
        "                            <ul class=\"nav nav-second-level navbartop2\">\n" +
        "                                <li  class=\"selectfeedbackPage\">\n" +
        "                                    <a href='javascript:void(0);' ng-click=\"goCancel('" + ctx + "appPage/admin/selectFeedback')\"> &nbsp;&nbsp;&nbsp;&nbsp;Search Feedback</a>\n" +
        "                                </li>\n" +
        "                                <li  class=\"feedbackPage\" >\n" +
        "                                   <a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/feedback')\"> &nbsp;&nbsp;&nbsp;&nbsp;Question Feedback</a>"+
        "                                </li>\n" +
        "                            </ul>\n" +
        "                        </li>\n" +
        "                        <li>\n" +
        "                            <a href=\"#\"><i class=\"fa fa-sitemap fa-fw\"></i>Search For<span class=\"glyphicon glyphicon-test\"></span></a>\n" +
        "                            <ul class=\"nav nav-second-level navbartop3\">\n" +
        "                                <li  class=\"searchCollectionPage\">\n" +
        "                                    <a href='javascript:void(0);' ng-click=\"goCancel('" + ctx + "appPage/admin/searchCollection')\"> &nbsp;&nbsp;&nbsp;&nbsp;Search Collection</a>\n" +
        "                                </li>\n" +
        "                                <li  class=\"notagsPage\" >\n" +
        "                                   <a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/notags')\"> &nbsp;&nbsp;&nbsp;&nbsp;No Result Key Words</a>"+
        "                                </li>\n" +
        "                            </ul>\n" +
        "                        </li>\n" +
        "                <li class=\"reportPage\"><a href=\"javascript:void(0);\" ng-click=\"goCancel('" + ctx + "appPage/admin/report')\">Report</a></li>\n" +
        "            </ul>\n" +
        "        </div>\n" +
        "    </div>\n" +
        "</nav>";
    return {
        restrict: 'E',
        template: templateHtml
    }
});

// 初始化页面
$(document).ready(function(){
    $(".faqRoleTest").text(faqRole);
});


/**
 * 元素级别的访问控制指令
 */
myapp.directive("zgAccess", function(){
    // 后台获取
/*    (function(){
        // 直线在HTML 标签添加zg-access="access"
        $.ajax({
            type:"post",
            url:ctx + "appJson/admin/getUser",
            async : false,
            success:function(data){
                faqRole = data;
            }
        });
    })();*/
    return {
        restrict: 'A',
        compile: function(element, attr) {
            switch(faqRole) {
                case "agent": element.remove(); break;
            }
        }
    }
})
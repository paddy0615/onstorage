var myapp = angular.module("myapp",['pascalprecht.translate']);

myapp.config(['$translateProvider',function($translateProvider){
    var lang = window.localStorage['lang'] || '6';
    $translateProvider
        .preferredLanguage(lang)
        .useStaticFilesLoader({
            prefix: ctx + 'js/i18n/',
            suffix: '.json'
        })
        .useSanitizeValueStrategy('escapeParameters');
}])
myapp.factory('T', ['$translate', function($translate) {
    var T = {
        T:function(key) {
            if(key){
                return $translate.instant(key);
            }
            return key;
        }
    }
    return T;
}]);

myapp.directive('onFinishRenderFilters', ['$timeout', function ($timeout) {
    return {
        restrict: 'A',
        link: function(scope,element,attr) {
            if (scope.$last === true) {
                var finishFunc=scope.$parent[attr.onFinishRenderFilters];
                if(finishFunc)
                {
                    finishFunc();
                }
            }
        }
    };
}])

// 路由
myapp.config(['$locationProvider', function($locationProvider) {
    // $locationProvider.html5Mode(true);
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
}]);

// index
myapp.controller("indexController",["$scope","$http","$location","$translate",function ($scope, $http,$location,$translate) {
    // 设置默认,langId==6语言，英文
    $scope.langId = GetUrlParam("langId")==""?1:GetUrlParam("langId");
    $translate.use($scope.langId.toString());

    if($scope.langId == 1){
        $scope.langTitle = '繁中';
        $scope.img24 = 'https://www.onestorage.com.hk/images/contact_24_7.png';
    }else{
        $scope.langTitle = 'ENG';
        $scope.img24 = 'https://www.onestorage.com.hk/images/contact_24_7_en.png';
    }

    // 语言事件
    $scope.clickLanguage = function() {
        var url = ctx + "appPage/index?catId=0&langId=";
        if($scope.langId == 1){
            url += "6";
        }else{
            url += "1";
        }

        clicked(url);
    }


    /* 搜索框 开始*/
    $scope.checkSearchTags = function(){
        $http({
            method : "post",
            url : ctx + "appJson/checkSearchTags",
            params : {"search": $scope.searchTest,"langId" : $scope.langId}
        }).success(function (data) {
        })
    }
    $scope.getSearchTags = function(){
        $http({
            method : "post",
            url : ctx + "appJson/getSearchTags",
            params : {"search": $scope.searchTest,"langId" : $scope.langId}
        }).success(function (data) {
            $scope.searchShow = true;
            $scope.indexShow = false;
            $scope.detaileds =  data.result.detaileds;
            $scope.folderList =  data.result.folderList;
            $scope.searchFeedback =  data.result.searchFeedback;

        })
    }
    $scope.searchTest = "";
    $scope.getSearch = function (){
        if($scope.searchTest == ""){
            $scope.detaileds =  {};
            return;
        };
        $scope.checkSearchTags();
        var q = escape($scope.searchTest);
        var url = ctx + "appPage/index?langId="+$scope.langId+"&catId="+0+"&q="+q;
        clicked(encodeURI(url));
    }
    $scope.onKeyup = function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==13){ // enter 键
            $scope.getSearch();
        }
    }
    var sq = $location.search().q;
    if(undefined != sq && "" != sq){
        $scope.searchTest = unescape(sq);
        $scope.getSearchTags();
    }
    /* 搜索框 结束*/

    /**
     * 搜索文件夹
     * @param key
     * @param langId
     */
    $scope.getFolderUrl = function (key,langId) {
        $scope.folderList = {};
        $http({
            method : "post",
            url : ctx + "appJson/getSearchFolder",
            params : {"key": key,"langId" : langId}
        }).success(function (data) {
            $scope.folderList =  data.result.folderList;
            $scope.detaileds =  data.result.detaileds;
        })
    }

    // 搜索反馈弹框
    $scope.alertSet = function () {
        $('#myModalAddFolder').modal();
    }

    $scope.selectFeedback = {};
    // 提交搜索反馈信息
    var lock1 = false; //默认未锁定
    $scope.addSelectFeedback = function () {
        if(!check1()){
            return;
        }
        if(!lock1) {
            lock1 = true; // 锁定
            var index = layer.load(0, {shade: false});
            $scope.selectFeedback.langId = $scope.langId;
            $http({
                method : "post",
                url : ctx + "appJson/addSelectFeedback",
                data : JSON.stringify($scope.selectFeedback)
            }).success(function (data) {
                lock1 = false;
                layer.close(index);
                if(data.code == 200){
                    layer.msg('OK', {icon: 1});
                    setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                        window.location.reload();//页面刷新
                    },1000);
                }else{
                    layer.msg("Error", {icon: 5});
                }
            })
        }
    }

    function check1() {
        console.log($scope.selectFeedback.email)
        var reg1 = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
        var reg2 =  /^\d*$/
        if(undefined != $scope.selectFeedback.email && "" != $scope.selectFeedback.email && !reg1.test($scope.selectFeedback.email)){ //正则验证不通过，格式不对
            alert(commonLabel8($scope.langId));
            return false;
        }
        if(undefined != $scope.selectFeedback.number && "" != $scope.selectFeedback.number && !reg2.test($scope.selectFeedback.number)){ //正则验证不通过，格式不对
            alert(commonLabel9($scope.langId));
            return false;
        }
        return true;
    }


}]);

// indexDetailed
myapp.controller("indexDetailedController",["$scope","$http","$sce","$location","$translate",function ($scope, $http, $sce,$location,$translate) {
    $scope.dlId = GetUrlParam("dlId");
    $scope.langId = GetUrlParam("langId")==""?1:GetUrlParam("langId");
    $scope.catId = 0;
    $scope.isGetUrl = false;
    $scope.detailed ={};
    $scope.searchShow = false;


    if($scope.langId == 1){
        $scope.langTitle = '繁中';
        $scope.img24 = 'https://www.onestorage.com.hk/images/contact_24_7.png';
    }else{
        $scope.langTitle = 'ENG';
        $scope.img24 = 'https://www.onestorage.com.hk/images/contact_24_7_en.png';
    }

    // 初始化
    into($scope.dlId);
    function into(dlId){
        $http({
            method : 'post',
            url : ctx + "appJson/getByDetailed",
            params:{"dlId": dlId}
        }).success(function (data) {
            $scope.isGetUrl = true;
            if(data){
                /* 成功*/
                $scope.result = data.result;
                $scope.langId = data.result.langId;
                $translate.use($scope.langId.toString());
                $scope.dfcount = data.result.dfcount;
                $scope.selectTest = selectTest($scope.langId);
                $scope.selectTestUnll = selectTestUnll($scope.langId);
                $scope.hotspotTest = hotspotTest($scope.langId);

                $scope.detailed = data.result.detailed;
                // 显示内容
                $scope.content = $sce.trustAsHtml($scope.detailed.content);
            }else{
                /* 失败*/
                layer.alert( 'Abnormal error.', {
                    skin: 'layui-layer-lan'
                    ,closeBtn: 0
                });
            }
        })
    }


    // 语言事件
    $scope.clickLanguage = function() {
        var url = ctx + "appJson/getIndexDetailedNew?dlId="+$scope.dlId;
        if($scope.langId == 1){
            url += "&langId=6";
        }else{
            url += "&langId=1";
        }
        clicked(url);
        // 强制更新  $scope.apply();
    }


    /* 搜索框  开始*/
    $scope.checkSearchTags = function(){
        $http({
            method : "post",
            url : ctx + "appJson/checkSearchTags",
            params : {"search": $scope.searchTest,"langId" : $scope.langId}
        }).success(function (data) {
        })
    }
    $scope.getSearchTags = function(){
        $http({
            method : "post",
            url : ctx + "appJson/getSearchTags",
            params : {"search": $scope.searchTest,"langId" : $scope.langId}
        }).success(function (data) {
            $scope.searchShow = true;
            $scope.detaileds =  data.result.detaileds;
        })
    }
    $scope.searchTest = "";
    $scope.getSearch = function (){
        if($scope.searchTest == ""){
            $scope.detaileds =  {};
            return;
        };
      /*  $scope.checkSearchTags();
        var q = escape($scope.searchTest);
        var url = ctx + "appPage/indexDetailed?dlId="+$scope.dlId+"&langId="+$scope.langId+"&q="+q;
        clicked(encodeURI(url));*/
        var url = ctx + "appPage/index?langId="+$scope.langId+"&catId="+0+"&q="+$scope.searchTest;
        clicked(encodeURI(url));

    }
    $scope.onKeyup = function(event){
        // $scope.arr1=$filter("filter")(arr,document.getElementById("wei").value);
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==13){ // enter 键
            $scope.getSearch();
        }

    }
    var sq = $location.search().q;
    if(undefined != sq && "" != sq){
        $scope.searchTest = unescape(sq);
        $scope.getSearchTags();
    }
    /* 搜索框  结束*/

    function info1(){
        $http({
            method : 'post',
            url : ctx + "appJson/getHotspot",
            params:{"langId": $scope.langId}
        }).success(function (data) {
            if(data){
                $scope.hotspots = data.result.detaileds;
            }
        })
        // 智能向导
        $http({
            method : 'post',
            url : ctx + "appJson/getSmartGuide",
            params:{"dlId": $scope.dlId}
        }).success(function (data) {
            if(data){
                $scope.smartGuide = data.result.detaileds;
                if($scope.smartGuide.length > 0){
                    $scope.smartGuideType = true;
                }else{
                    $scope.smartGuideType = false;
                }
            }
        })
    }
    // 热点初始化
    info1();

    $scope.praiseNayTest = 0;
    $scope.dfId1 = 0;
    $scope.dfId2 = 0;
    <!-- 反馈:支持-->
    $("#praise").click(function(){
        var praise_img = $("#praise-img");
        var text_box = $("#add-num");
        var praise_txt = $("#praise-txt");
        var num=parseInt(praise_txt.text());
        if(praise_img.attr("src") == (ctx + "img/zan1.png")){
            $(this).html("<img src='"+ctx + "img/hui1.png' id='praise-img' class='animation' />");
            praise_txt.removeClass("hover");
            text_box.show().html("<em class='add-animation'>-1</em>");
            $(".add-animation").removeClass("hover");
            num -=1;
            praise_txt.text(num);
            $("#praiseNayTest").hide();
            $scope.praiseNayTest = 0;
            delFeedback($scope.dfId1);
            $scope.dfId1 = 0;
        }else{
            $(this).html("<img src='"+ctx + "img/zan1.png' id='praise-img' class='animation' />");
            praise_txt.addClass("hover");
            text_box.show().html("<em class='add-animation'>+1</em>");
            $(".add-animation").addClass("hover");
            num +=1;
            praise_txt.text(num);
            $("#praiseNayTest").show();
            $scope.praiseNayTest = 1;
            addFeedback(1,"");
        }
    });
    <!-- 反馈:反对-->
    $("#praise1").click(function(){
        var praise_img = $("#praise-img1");
        var text_box = $("#add-num1");
        var praise_txt = $("#praise-txt1");
        var num=parseInt(praise_txt.text());
        if(praise_img.attr("src") == (ctx + "img/zan2.png")){
            $(this).html("<img src='"+ctx + "img/hui2.png' id='praise-img1' class='animation' />");
            text_box.show().html("<em class='add-animation'>-1</em>");
            $(".add-animation").removeClass("hover");
            $("#praiseNayTest").hide();
            $scope.praiseNayTest = 0;
            delFeedback($scope.dfId2);
            $scope.dfId2 = 0;
        }else{
            $(this).html("<img src='"+ctx + "img/zan2.png' id='praise-img1' class='animation' />");
            text_box.show().html("<em class='add-animation'>+1</em>");
            $(".add-animation").addClass("hover");
            $("#praiseNayTest").show();
            $scope.praiseNayTest = 2;
            addFeedback(2,"");
        }
    });
    <!-- 反馈:add异步-->
    function addFeedback(type,content) {
        $http({
            method : "post",
            url : ctx + "appJson/addFeedback",
            data : {"type" : type,"dlId" : $scope.dlId,"content" : content}
        }).success(function (data) {
            if(data.result.type == 1){
                $scope.dfId1 = data.result.id;
            }else{
                $scope.dfId2 = data.result.id;
            }
        })
    }
    function delFeedback(dfId) {
        if(dfId > 0){
            $http({
                method : "post",
                url : ctx + "appJson/delFeedback",
                data : {"id" : dfId}
            }).success(function (data) {
            })
        }

    }
    $scope.dfContent = "";
    $scope.dfContentEmail = "";
    $scope.dfContentNumber = "";
    $scope.addDfContent = function () {
        if(!check1()){
            return;
        }
        var id = 0;
        if($scope.praiseNayTest == 1){
            id = $scope.dfId1
        }else if($scope.praiseNayTest == 2){
            id = $scope.dfId2
        }
        var index = layer.load(0, {shade: false});
        $http({
            method : "post",
            url : ctx + "appJson/updateFeedback",
            data : {"id":id,"type" : $scope.praiseNayTest,"dlId" : $scope.dlId,"content" : $scope.dfContent,"email":$scope.dfContentEmail,"number":$scope.dfContentNumber}
        }).success(function (data) {
            layer.close(index);
            if(data.code == 200){
                layer.msg('OK', {icon: 1});
                $scope.dfContent = "";
                $scope.dfContentEmail = "";
                $scope.dfContentNumber = "";
                setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                    window.location.reload();//页面刷新
                },1000);

            }else{
                layer.msg("Error", {icon: 5});
            }
        })
    }

    function check1() {
        var reg1 = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/
        var reg2 =  /^\d*$/
        if("" != $("#dfContentEmail").val() && !reg1.test($("#dfContentEmail").val())){ //正则验证不通过，格式不对
            alert(commonLabel8($scope.langId));
            return false;
        }
        if("" != $("#dfContentNumber").val() && !reg2.test($("#dfContentNumber").val())){ //正则验证不通过，格式不对
            alert(commonLabel9($scope.langId));
            return false;
        }
        return true;
    }


}]);

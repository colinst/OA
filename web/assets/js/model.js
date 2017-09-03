function show() {
    /*$('#show').css('display','block');*/
    var a3 = document.getElementById("custom");
    a3.style.display = "inherit";
    var a1 = document.getElementById("model");
    a1.style.display = "none";

}
function hide() {
    var a1 = document.getElementById("custom");
    a1.style.display = "none";
    var a3 = document.getElementById("model");
    a3.style.display = "inherit";
    $("#context2").hide()

}
function pageTest(obj) {

    window.location.href = "selectModel.do?currentPage=" + obj;
}

function add() {
    /*$('#show').css('display','block');*/
    var a3 = document.getElementById("content");
    a3.style.display = "inherit";
    var a1 = document.getElementById("add");
    a1.style.display = "none";
}
function use() {
    document.getElementById('use_table').submit();
}
function stat() {
    document.getElementById('sys_stat').submit();


}
function write_submit() {
    var flag = true;
    var x = document.getElementsByName("list[0].columnName");
    for (var i = 0; i < x.length; i++) {
        if (x[i].value == "") {
            alert("还有未填写的内容不能提交！")
            flag = false;
            return false;// 有空值
        }

    }
    if (flag) {
        document.getElementById('writeinstat').submit();
    }
}

var isCheckAll = false;
function swapCheck() {
    if (isCheckAll) {
        $("input[type='checkbox']").each(function () {
            this.checked = false;
        });
        isCheckAll = false;
    } else {
        $("input[type='checkbox']").each(function () {
            this.checked = true;
        });
        isCheckAll = true;
    }
}
var idTmr;
//得到浏览器类型
function getExplorer() {
    var explorer = window.navigator.userAgent;
    //ie
    if (explorer.indexOf("MSIE") >= 0) {
        return 'ie';
    }
    //firefox
    else if (explorer.indexOf("Firefox") >= 0) {
        return 'Firefox';
    }
    //Chrome
    else if (explorer.indexOf("Chrome") >= 0) {
        return 'Chrome';
    }
    //Opera
    else if (explorer.indexOf("Opera") >= 0) {
        return 'Opera';
    }
    //Safari
    else if (explorer.indexOf("Safari") >= 0) {
        return 'Safari';
    }
}
function getExcel(tableid) {
    if (getExplorer() == 'ie') {
        var curTbl = document.getElementById(tableid);
        var oXL = new ActiveXObject("Excel.Application");
        var oWB = oXL.Workbooks.Add();
        var xlsheet = oWB.Worksheets(1);
        var sel = document.body.createTextRange();
        sel.moveToElementText(curTbl);
        sel.select();
        sel.execCommand("Copy");
        xlsheet.Paste();
        oXL.Visible = true;

        try {
            var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
        } catch (e) {
            print("Nested catch caught " + e);
        } finally {
            oWB.SaveAs(fname);
            oWB.Close(savechanges = false);
            oXL.Quit();
            oXL = null;
            idTmr = window.setInterval("Cleanup();", 1);
        }

    }
    else {
        tableToExcel(tableid)
    }
}
function Cleanup() {
    window.clearInterval(idTmr);
    CollectGarbage();
}
var tableToExcel = (function () {
    var uri = 'data:application/vnd.ms-excel;base64,',
        template = '<html><head><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',
        base64 = function (s) {
            return window.btoa(unescape(encodeURIComponent(s)))
        },
        format = function (s, c) {
            return s.replace(/{(\w+)}/g,
                function (m, p) {
                    return c[p];
                })
        }
    return function (table, name) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
        window.location.href = uri + base64(format(template, ctx))
    }
})()
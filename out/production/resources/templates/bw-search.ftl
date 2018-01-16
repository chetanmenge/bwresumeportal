<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Bitwise - Resume Portal</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        /* CSS REQUIRED */
        .state-icon {
            left: -5px;
        }
        .list-group-item-primary {
            color: rgb(255, 255, 255);
            background-color: rgb(66, 139, 202);
        }

        /* DEMO ONLY - REMOVES UNWANTED MARGIN */
        .well .list-group {
            margin-bottom: 0px;
        }
    </style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; ">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
<!--                 <img src="../images/bwlogo1.png"/>
 -->                <a class="navbar-brand" href="/">Bitwise - Resume Portal v0.1</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right hidden-xs">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <!-- <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li> -->
                        <li>
                            <a href="#" id="logout-link" class="logout-link"><i class="fa fa-gear fa-sign-out fa-fw"></i> Logout</a>
                        	<form action="/logout" style="display:hidden;" id="bwlogoutform" method="post">
					          	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="/rmLanding"><i class="fa fa-cloud fa-fw"></i> Resume Portal - Home</a>
                        </li>
                        <li>
                            <a href="/uploadLanding"><i class="fa fa-cloud-upload fa-fw"></i> Upload</a>
                        </li>
                        <li>
                            <a href="/search-resume"><i class="fa fa-search fa-fw"></i> Search</a>
                        </li>
                        <li class="visible-xs-block">
                            <a href="#" class="logout-link"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    
<#if downloadSuccess?? && downloadSuccess="false">
	 <font color="red"> <label  class="col-md-4 control-label" for="selectbasic"> ${errorMsg} </label> </font>
</#if>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

 <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        <i class="fa fa-search fa-1x"></i>
                        Search Profiles
                    </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-2">
                    <form action="/search-resume"  role="form">
                         <div class="form-group">
                            <label>Select Skills</label>
                            <div class="well" style="max-height: 400px; overflow: auto; padding: 3px">
                                <ul id="skillList" class="list-group checked-list-box">
                                		<#if skills??>
	                                     <#list skills as skill>
	                                        <li class="list-group-item" skill-id="${skill.skillId?html}">${skill.name?html}</li>
	                                     </#list>
	                                     </#if>
                                </ul>
                            </div>
                        </div>
                        <input type="hidden" name="selectedSkills" id="selectedSkills"/>

                      <!--   <button class="btn btn-primary col-xs-12" id="get-checked-data">Get Checked Data</button> -->
                        <button type="submit" class="btn btn-default">Search</button>
<!--                         <button type="reset" class="btn btn-default">Reset</button>
 -->                    </form>

                </div>

                <div class="col-lg-10">
                    <div class="panel-body">
                    		<#if (resumes?? && resumes?size >= 1) >
                            <table width="100%" class="table table-striped table-bordered table-hover" id="searchResult-table">
                                <thead>
                                    <tr>
                                        <th class="col-lg-2">Name (Linked Resume)</th>
                                        <th class="col-lg-4">Skills</th>
                                        <th class="col-lg-2">Upload Date</th>
                                        <th class="col-lg-1">Upload By</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <#list resumes as resume>
                                    <tr class="gradeA">
                                        <td><a href="/download?key=${resume.resumeId}&fileName=${resume.resumeName}">${resume.resumeName}</a></td>
                                        <td>${resume.resumeSkills}</td>
                                        <td>${resume.uploadedTime}</td>
                                        <td>${resume.uploadedBy}</td>
                                    </tr>
                                </#list>    
                                </tbody>
                            </table>
                            </#if>
                        </div>
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <script src="js/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    <script src="js/bw-portal-1.js"></script>
<script type="text/javascript">
        function getUrlVar(key){
    var result = new RegExp(key + "=([^&]*)", "i").exec(window.location.search); 
    return result && unescape(result[1]) || ""; 
};
var selSkillsResult=getUrlVar('selectedSkills').split(',');

        $(function () {
    $('.list-group.checked-list-box .list-group-item').each(function () {
        
        // Settings
        var $widget = $(this),
            $checkbox = $('<input type="checkbox" class="hidden" />'),
            color = ($widget.data('color') ? $widget.data('color') : "primary"),
            style = ($widget.data('style') == "button" ? "btn-" : "list-group-item-"),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };
            
        $widget.css('cursor', 'pointer')
        $widget.append($checkbox);

        // Event Handlers
        $widget.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
        });
        $checkbox.on('change', function () {
            updateDisplay();
        });
        if(selSkillsResult.indexOf($widget.attr("skill-id"))!=-1){
            $checkbox.prop('checked', true);
            updateDisplay();
        }

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');

            // Set the button's state
            $widget.data('state', (isChecked) ? "on" : "off");

            // Set the button's icon
            $widget.find('.state-icon')
                .removeClass()
                .addClass('state-icon ' + settings[$widget.data('state')].icon);

            // Update the button's color
            if (isChecked) {
                $widget.addClass(style + color + ' active');
            } else {
                $widget.removeClass(style + color + ' active');
            }
                var selectedSkills = "";

                $("#skillList li.active").each(function(idx, li) {
                        if(selectedSkills==""){
                          selectedSkills = $(li).attr("skill-id");
                        }else{
                          selectedSkills = selectedSkills+"," + $(li).attr("skill-id");
                        }
                });
                $("#selectedSkills").val(selectedSkills);
        }

        // Initialization
        function init() {
            
            if ($widget.data('checked') == true) {
                $checkbox.prop('checked', !$checkbox.is(':checked'));
            }
            
            updateDisplay();

            // Inject the icon if applicable
            if ($widget.find('.state-icon').length == 0) {
                $widget.prepend('<span class="state-icon ' + settings[$widget.data('state')].icon + '"></span>');
            }
        }
        init();
    });
    
    $('#get-checked-data').on('click', function(event) {
        event.preventDefault(); 
        var checkedItems = {}, counter = 0;
        $("#skillList li.active").each(function(idx, li) {
            checkedItems[counter] = $(li).text();
            counter++;
        });
        $('#display-json').html(JSON.stringify(checkedItems, null, '\t'));
    });
});

    $(document).ready(function() {
        $('#searchResult-table').DataTable({
            responsive: true
        });
    });
    </script>
</body>

</html>

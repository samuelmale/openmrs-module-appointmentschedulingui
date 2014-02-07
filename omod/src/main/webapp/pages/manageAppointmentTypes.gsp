<%
    ui.decorateWith("appui", "standardEmrPage")
    ui.includeCss("appointmentschedulingui", "appointmentType.css")
    ui.includeJavascript("appointmentschedulingui", "manageAppointmentType.js")
%>


<script type="text/javascript">
var breadcrumbs = [
{ icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
{ label: "${ ui.message("emr.app.systemAdministration.label")}", link: '${ui.pageLink("emr", "systemAdministration")}' },
{ label: "${ ui.message("appointmentschedulingui.appointmenttype.label")}" }
];
</script>


<div class="container">
    <div>
        <div id="manageAppointmentsTypeTitle" class="appointment-type-label">
            <h1>
                ${ ui.message("appointmentschedulingui.appointmenttype.label") }
            </h1>
        </div>

        <button class="confirm appointment-type-label right"
                    onclick="location.href='${ui.pageLink("appointmentschedulingui", "appointmentType")}'">
                <i class="icon-plus"></i>
                ${ ui.message("appointmentschedulingui.appointmenttype.button")}
        </button>

    </div>
    <div id="appointmentTypes-list">
        <table id="appointmentTypesTable" empty-value-message='${ ui.message("uicommons.dataTable.emptyTable") }'>
            <thead>
            <tr>
                <th style="width: 40%">${ ui.message("appointmentschedulingui.scheduleAppointment.date") }</th>
                <th style="width: 15%">${ ui.message("appointmentschedulingui.appointmenttype.title") }</th>
                <th style="width: 30%">${ ui.message("appointmentschedulingui.scheduleAppointment.provider") }</th>
                <th style="width: 15%">${ ui.message("appointmentschedulingui.scheduleAppointment.location") }</th>
            </tr>
            </thead>
            <tbody>
            <% appointmentTypeList.each { appointmentType -> %>

            <tr>
                <td>${ ui.format(appointmentType.name) }</td>
                <td>${ ui.format(appointmentType.duration) }</td>
                <td>${ ui.format(appointmentType.description)}</td>
                <td class="align-center">
                    <span>
                        <i class="editAppointmentType delete-item icon-pencil"
                           data-appointment-type-id="${ appointmentType.id}"
                           data-edit-url='${ui.pageLink("appointmentschedulingui", "appointmentType")}'
                           title="${ ui.message("coreapps.edit") }"></i>
                        <i class="deleteAppointmentType delete-item icon-remove"
                           data-appointment-type-id="${ appointmentType.id}"
                           title="${ ui.message("coreapps.delete") }"></i>
                    </span>
                </td>
            </tr>



            <div id="delete-appointment-type-dialog" class="dialog" style="display: none">
                <div class="dialog-header">
                    <h3>${ ui.message("appointmentschedulingui.manageappointmenttype.deleteAppointmentTypeTitleDialog")}</h3>
                </div>
                <div class="dialog-content">
                    <input type="hidden" id="encounterId" value="">
                    <ul>
                        <li class="info">
                            <span>${ ui.message("appointmentschedulingui.manageappointmenttype.deleteAppointmentTypeMessageDialog")}</span>
                        </li>
                    </ul>

                    <button class="confirm right">${ ui.message("emr.yes")}
                        <i class="icon-spinner icon-spin icon-2x" style="display: none; margin-left: 10px;"></i></button>
                    <button class="cancel">${ ui.message("emr.no")}</button>
                </div>
            </div>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

${ ui.includeFragment("uicommons", "widget/dataTable", [ object: "#appointmentTypesTable",
        options: [
                bFilter: false,
                bJQueryUI: true,
                bLengthChange: false,
                iDisplayLength: 10,
                sPaginationType: '\"full_numbers\"',
                bSort: false,
                sDom: '\'ft<\"fg-toolbar ui-toolbar ui-corner-bl ui-corner-br ui-helper-clearfix datatables-info-and-pg \"ip>\''
        ]
]) }


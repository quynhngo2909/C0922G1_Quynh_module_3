<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--Modal create facility - Step 1--%>
<div class="modal fade" id="createFacility" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="mainCreate">Create new facility</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <%--      Link--%>
      <form action="/ServiceServlet?action=create" method="get">
        <div class="modal-body">
          <span>Please choose new created facility </span>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button id="villa" type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#create">Villa</button>
          <button id="house" type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#create">House</button>
          <button id="room" type="button" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#create">Room</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%--Modal create Facility--%>
<div class="modal fade" id="create" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="createVillaLabel">Create new facility</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <%--      Link--%>
      <form action="/ServiceServlet?action=create" method="post">
        <div class="modal-body">
          <span>Facility information </span>
        </div>
        <table class="table table-hover">
          <tr>
            <td><label for="name">Name</label></td>
            <td><input name="name" id="name" type="text" required="required" placeholder="Input name">
            </td>
            <td hidden><i class="bi bi-check" id="checkName"></i></td>
            <td><span id="errorName"></span></td>
          </tr>
          <tr>
            <td><label for="area">Area</label></td>
            <td><input name="area" id="area" type="text" required="required"></td>
            <td hidden><i class="bi bi-check" id="checkArea"></i></td>
            <td hidden><span id="errorArea"></span></td>
          </tr>
          <tr>
            <td><label for="cost">Cost</label></td>
            <td><input name="cost" id="cost" type="text" required="required"></td>
            <td hidden><i class="bi bi-check" id="checkCost"></i></td>
            <td hidden><span id="errorCost"></span></td>
          </tr>
          <tr>
            <td><label for="maxPeople">Max people</label></td>
            <td>
              <input name="maxPeople" id="maxPeople" type="text" required="required">
            </td>
            <td hidden><i class="bi bi-check" id="checkMaxPeople"></i></td>
            <td hidden><span id="errorMaxPeople"></span></td>
          </tr>
<%--//TODO select rent type--%>
          <tr>
            <td ><label for="rentType">Rent Type</label></td>
            <td>
              <input name="rentType" id="rentType" type="text" required="required" >
            </td>
            <td hidden><i class="bi bi-check" id="checkRentType"></i></td>
            <td hidden><span id="errorRentType"></span></td>
          </tr>
          <%--//TODO select facility type--%>
          <tr>
            <td><label for="facilityType">Facility Type</label></td>
            <td>
              <input name="facilityType" id="facilityType" type="text" required="required" >
            </td>
            <td hidden><i class="bi bi-check" id="checkFacilityType"></i></td>
            <td hidden><span id="errorFacilityType"></span></td>
          </tr>
          <tr>
            <td><label for="standardRoom">Standard Room</label></td>
            <td>
              <input name="standardRoom" id="standardRoom" type="text" required="required">
            </td>
            <td hidden><i class="bi bi-check" id="checkStandardRoom"></i></td>
            <td hidden><span id="errorStandardRoom"></span></td>
          </tr>
          <tr>
            <td><label for="descriptionOtherConvenience">Other Convenience</label></td>
            <td>
              <input name="descriptionOtherConvenience" id="descriptionOtherConvenience" type="text"
                     required="required">
            </td>
            <td hidden><i class="bi bi-check" id="checkOtherConvenience"></i></td>
            <td hidden><span id="errorOtherConvenience"></span></td>
          </tr>
          <tr class="villaAttribute">
            <td><label for="poolArea">Pool Area</label></td>
            <td>
              <input name="poolArea" id="poolArea" type="text" required="required" value="">
            </td>
            <td hidden><i class="bi bi-check" id="checkPoolArea"></i></td>
            <td hidden><span id="errorPoolArea"></span></td>
          </tr>
          <tr class="villaHouseAttribute">
            <td><label for="numberOfFloors">Number Of Floors</label></td>
            <td>
              <input name="numberOfFloors" id="numberOfFloors" type="text" required="required" value="">
            </td>
            <td hidden><i class="bi bi-check" id="checkNumberOfFloors"></i></td>
            <td hidden><span id="errorNumberOfFloors"></span></td>
          </tr>
          <tr class="roomAttribute">
            <td><label for="facilityFree">Facility Free</label></td>
            <td>
              <input name="facilityFree" id="facilityFree" type="text" required="required" value="">
            </td>
            <td hidden><i class="bi bi-check" id="checkFacilityFree"></i></td>
            <td hidden><span id="errorFacilityFree"></span></td>
          </tr>
        </table>
        <div class="modal-footer">
          <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-sm btn-primary" >Create</button>
        </div>
      </form>
    </div>
  </div>
</div>
<%--//jQuery hide() and show()--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
  $(document).ready(function(){
    $("#villa").click(function(){
      $("tr").show();
      $(".houseAttribute").hide();
      $(".roomAttribute").hide();
    });
    $("#house").click(function(){
      $("tr").show();
      $(".villaAttribute").hide();
      $(".roomAttribute").hide();
    });
    $("#room").click(function(){
      $("tr").show();
      $(".houseAttribute").hide();
      $(".villaAttribute").hide();
      $(".villaHouseAttribute").hide();
    });
  });
</script>
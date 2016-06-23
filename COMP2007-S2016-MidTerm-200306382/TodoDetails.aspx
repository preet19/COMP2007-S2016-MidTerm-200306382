<%@ Page Title="Todo Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TodoDetails.aspx.cs" Inherits="COMP2007_S2016_MidTerm_200306382.TodoDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- 
    Filename = TodoDetails.aspx
    Author's name = Dilpreet Singh
    Student # 200306382
    website = http://comp2007-s2016-midterm-200306382.azurewebsites.net/
    file description =  file contain all the code for making a todo list
     -->

    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <h1>Todo Task Details</h1>
                <h5>All Fields are Required</h5>
                <br />
                <div class="form-group">
                    <label class="control-label" for="TodoNameTextBox">Todo</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="TodoNameTextBox" placeholder="enter task" required="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label class="control-label" for="NotesTextBox">Notes</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="NotesTextBox" placeholder="Notes" required="true"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:CheckBox Text=" Completed" runat="server" ID="CheckBox" placeholder="CheckBox" />
                </div>


                <div class="text-right">
                    <asp:Button Text="Cancel" ID="CancelButton" CssClass="btn btn-warning btn-lg" runat="server"
                        UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton_Click" />
                    <asp:Button Text="Save" ID="SaveButton" CssClass="btn btn-primary btn-lg" runat="server" OnClick="SaveButton_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>

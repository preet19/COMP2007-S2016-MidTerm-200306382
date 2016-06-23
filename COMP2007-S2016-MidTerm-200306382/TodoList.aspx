﻿<%@ Page Title="Todo List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TodoList.aspx.cs" Inherits="COMP2007_S2016_MidTerm_200306382.TodoList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- 
    Filename = TodoList.aspx
    Author's name = Dilpreet Singh
    Student # 200306382
    website = http://comp2007-s2016-midterm-200306382.azurewebsites.net/
    file description =  file contain all the code for todo listing
    -->
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8">
                <h1>Student List</h1>
                <a href="TodoDetails.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i>Add ToDo Task</a>

                <div>
                    <label for="PageSizeDropDownList">Records per Page: </label>
                    <asp:DropDownList ID="PageSizeDropDownList" runat="server"
                        AutoPostBack="true" CssClass="btn btn-default bt-sm dropdown-toggle"
                        OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                        <asp:ListItem Text="3" Value="3" />
                        <asp:ListItem Text="5" Value="5" />
                        <asp:ListItem Text="10" Value="10" />
                        <asp:ListItem Text="All" Value="10000" />
                    </asp:DropDownList>
                </div>

                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover"
                    ID="TodoGridView" AutoGenerateColumns="false" DataKeyNames="TodoID"
                    OnRowDeleting="TodoGridView_RowDeleting" AllowPaging="true" PageSize="3"
                    OnPageIndexChanging="TodoGridView_PageIndexChanging" AllowSorting="true"
                    OnSorting="TodoGridView_Sorting" OnRowDataBound="TodoGridView_RowDataBound" 
                    PagerStyle-CssClass="pagination-ys">
                    <Columns>
                        <asp:BoundField DataField="TodoID" HeaderText="Todo ID" Visible="true" SortExpression="TodoID" />
                        <asp:BoundField DataField="TodoName" HeaderText="Task Name" Visible="true" SortExpression="TodoName" />
                        <asp:BoundField DataField="TodoNotes" HeaderText="Notes" Visible="true" SortExpression="TodoNotes" />
                        <asp:TemplateField HeaderText="Completed" SortExpression="Completed"><ItemTemplate><asp:CheckBox  runat="server" Visible="true"  /></ItemTemplate> </asp:TemplateField>
                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" 
                            NavigateUrl="~/TodoDetails.aspx.cs" ControlStyle-CssClass="btn btn-primary btn-sm" runat="server"
                            DataNavigateUrlFields="TodoID" DataNavigateUrlFormatString="TodoDetails.aspx?TodoID={0}" />
                        <asp:CommandField  HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete"
                            ShowDeleteButton="true" ButtonType="Link" ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>This example demonstrates how to show all the text of an ASPxGridView's column in the ASPxPopUpControl, using ASPxGridView's templates</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dxwgv:ASPxGridView runat="server" ID="Grid" DataSourceID="AccessDataSource1" KeyFieldName="CategoryID">
                <Columns>
                    <dxwgv:GridViewDataColumn Caption="ID" FieldName="CategoryID">
                    </dxwgv:GridViewDataColumn>
                    <dxwgv:GridViewDataColumn Caption="Name" FieldName="CategoryName">
                    </dxwgv:GridViewDataColumn>
                    <dxwgv:GridViewDataColumn Caption="Description" FieldName="Description">
                        <DataItemTemplate>
                            <div>
                                <%# GetPreviewText(Eval("Description"), 10) %>
                            </div>
                            <dxpc:ASPxPopupControl runat="server" ID="PopUp" HeaderText='<%# Container.Column %>'
                                ClientInstanceName='<%# GetClientInstanceName(Container.ItemIndex) %>' PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Below">
                                <ContentCollection>
                                    <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                        <dxe:ASPxMemo runat="server" ID="Memo" Text='<%# Eval("Description") %>' Width="100%">
                                        </dxe:ASPxMemo>
                                    </dxpc:PopupControlContentControl>
                                </ContentCollection>
                            </dxpc:ASPxPopupControl>
                        </DataItemTemplate>
                    </dxwgv:GridViewDataColumn>
                    <dxwgv:GridViewDataColumn>
                        <DataItemTemplate>
                            <dxe:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl="javascript:void(0);" ImageUrl="Images/ShowAllText.gif"
                                ClientSideEvents-Click='<%# GetClickHandler(Container.ItemIndex) %>'>
                            </dxe:ASPxHyperLink>
                        </DataItemTemplate>
                    </dxwgv:GridViewDataColumn>
                </Columns>
            </dxwgv:ASPxGridView>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
                SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"
                DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?" InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (?, ?, ?)"
                UpdateCommand="UPDATE [Categories] SET [CategoryName] = ?, [Description] = ? WHERE [CategoryID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CategoryName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="CategoryName" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
            </asp:AccessDataSource>
        </div>
    </form>
</body>
</html>

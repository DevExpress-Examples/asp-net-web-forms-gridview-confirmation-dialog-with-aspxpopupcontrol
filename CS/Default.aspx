<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.9.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript">
            var visibleIndex;
            function OnCustomButtonClick(s, e) {
                visibleIndex = e.visibleIndex;
                popup.Show();
            }
            function OnClickYes(s, e) {
                grid.DeleteRow(visibleIndex);
                popup.Hide();
            }
            function OnClickNo(s, e) {
                popup.Hide();
            }
        </script>
        <div>
            <dx:ASPxGridView ID="GridView" runat="server" DataSourceID="sqlData" KeyFieldName="ProductID" ClientInstanceName="grid" AutoGenerateColumns="False">
                <ClientSideEvents CustomButtonClick="OnCustomButtonClick" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" />
                    <dx:GridViewDataTextColumn FieldName="ProductName" />
                    <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="2" />
                    <dx:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="3" />
                    <dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="4" />
                    <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="deleteButton" Text="Delete" />
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                </Columns>
            </dx:ASPxGridView>
            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" Text="Are you sure?" ClientInstanceName="popup">
                <ContentCollection>
                    <dx:PopupControlContentControl>
                        <dx:ASPxButton ID="yesButton" runat="server" Text="Yes" AutoPostBack="false">
                            <ClientSideEvents Click="OnClickYes" />
                        </dx:ASPxButton>
                        <dx:ASPxButton ID="noButton" runat="server" Text="No" AutoPostBack="false">
                            <ClientSideEvents Click="OnClickNo" />
                        </dx:ASPxButton>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <asp:SqlDataSource ID="sqlData" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString %>"
                DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @ProductID"
                InsertCommand="INSERT INTO [Products] ([ProductID], [ProductName], [CategoryID], [UnitsInStock], [Discontinued]) VALUES (@ProductID, @ProductName, @CategoryID, @UnitsInStock, @Discontinued)"
                SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitsInStock], [Discontinued] FROM [Products]"
                UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [CategoryID] = @CategoryID, [UnitsInStock] = @UnitsInStock, [Discontinued] = @Discontinued WHERE [ProductID] = @ProductID">
                <DeleteParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="UnitsInStock" Type="Int16" />
                    <asp:Parameter Name="Discontinued" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="UnitsInStock" Type="Int16" />
                    <asp:Parameter Name="Discontinued" Type="Boolean" />
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>

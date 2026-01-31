<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoard.aspx.cs" Inherits="LogInForm.DashBoard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <style>
        .container {
            width: 500px;
            margin: auto;
            border: solid 2px black;
            padding: 20px;
            font-family: Arial, sans-serif;
            background-color:azure;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        td {
            padding: 5px;
            border: 1px solid #000;
        }
        h2 {
            text-align: center;
        }
        .logout-btn {
            margin-top: 10px;
            width: 100px;
            height: 30px;
            background-color:aliceblue;
            border-radius:10px;         
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Welcome, <asp:Label ID="lblUser" runat="server" /></h2>
            <table>
                <tr><td>First Name</td><td><asp:Label ID="lblFirstName" runat="server" /></td></tr>
                <tr><td>Last Name</td><td><asp:Label ID="lblLastName" runat="server" /></td></tr>
                <tr><td>Email</td><td><asp:Label ID="lblEmail" runat="server" /></td></tr>
                <tr><td>Contact</td><td><asp:Label ID="lblContact" runat="server" /></td></tr>
                <tr><td>Address</td><td><asp:Label ID="lblAddress" runat="server" /></td></tr>
                <tr><td>Gender</td><td><asp:Label ID="lblGender" runat="server" /></td></tr>
                <tr><td>Username</td><td><asp:Label ID="lblUsername" runat="server" /></td></tr>
                <tr><td>Photo</td><td><asp:Image ID="imgPhoto" runat="server" Width="90px" Height="90px" /></td></tr>
            </table>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout-btn" OnClick="btnLogout_Click" />
        </div>
    </form>
</body>
</html>

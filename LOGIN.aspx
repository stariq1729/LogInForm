<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LOGIN.aspx.cs" Inherits="LogInForm.LOGIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
       
        .auto-style2 {
            text-align:center;
            font-size:30px;
        }
        table{
            margin:auto;
            width:300px;
            border:5px black ridge;
        }
        .link{
            text-align:center;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="4" cellspacing="4">
                <tr>
                    <td class="auto-style2" colspan="2">LOGIN PAGE</td>
                </tr>
                <tr>
                    <td >USERNAME</td>
                    <td>
                        <asp:TextBox ID="UsertextBox" runat="server" Width="184px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UsertextBox" Display="Dynamic" ErrorMessage="please enter username" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>PASSWORD</td>
                    <td>
                        <asp:TextBox ID="PassTextBox" runat="server" Width="184px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PassTextBox" Display="Dynamic" ErrorMessage="Please Enter Pass" ForeColor="#CC0000" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="2">
                        <asp:Button ID="LogInButton" runat="server" Text="Login" OnClick="LogInButton_Click" BackColor="#999999" Height="27px" Width="53px" />
                    </td>
                    <%--<td class><input type="checkbox" onchange="document.getElementById('PassTextBox').type = this.checked ? 'text' : 'password'" />Show Password</td>--%>
                </tr>
                <tr>
                    <td class="link"  colspan="2">
                        <a href="register.aspx">Not registered yet ? click here</a>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

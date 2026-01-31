<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="LogInForm.register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up Form</title>
    <style type="text/css">
        
        .auto-style1 { width: 400PX; margin:auto; border:ridge 5px black;
                       background-color:aliceblue;
                       border-radius: 15px;
        }
        .auto-style2 { text-align:center; font-size:30px; }
        .auto-style3 { width: 121px; }
        .auto-style4 { width: 121px; height: 32px; }
        .auto-style5 { height: 32px; }
        .auto-style6 { width: 121px; height: 35px; }
        .auto-style7 { height: 35px; }
        .auto-style8 { height: 39px; }
        #button1{
            border-radius:12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        button:hover { background-color: #4CAF50; }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div>
             <table cellpadding="4" cellspacing="5" class="auto-style1">
                <tr>
                    <td class="auto-style2" colspan="2">SIGN UP FORM</td>
                </tr>
                <tr>
                    <td class="auto-style3">FIRST NAME</td>
                    <td>
                        <asp:TextBox ID="FirstNameTextBox" runat="server" Width="188px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="FirstNameTextBox" Display="Dynamic" ErrorMessage="Please Enter First Name"
                            ForeColor="Maroon" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">LASTNAME</td>
                    <td>
                        <asp:TextBox ID="SecondNameTextBox" runat="server" Width="188px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="SecondNameTextBox" Display="Dynamic" ErrorMessage="Please Enter Second Name"
                            ForeColor="Maroon" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">GENDER</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="195px" Height="16px">
                            <asp:ListItem>SELECT</asp:ListItem>
                            <asp:ListItem>MALE</asp:ListItem>
                            <asp:ListItem>FEMALE</asp:ListItem>
                            <asp:ListItem>OTHERS</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="SELECT"
                            ControlToValidate="DropDownList1" Display="Dynamic" ErrorMessage="Select Gender"
                            ForeColor="Maroon" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">EMAIL</td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Width="188px"></asp:TextBox>
                        <asp:Label ID="EmailErrorLabel" runat="server" ForeColor="Red"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="Please Enter Email"
                            ForeColor="Maroon" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="EmailTextBox" Display="Dynamic" ErrorMessage="please enter valid email"
                            ForeColor="Maroon" SetFocusOnError="True"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">CONTACT NO.</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="Contact" runat="server" Width="188px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                            ControlToValidate="Contact" Display="Dynamic" ErrorMessage="Please Enter the mobile number"
                            ForeColor="Maroon" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="Contact_validator" runat="server"
                            ControlToValidate="Contact" Display="Dynamic" ErrorMessage="only numbers are allowed"
                            ForeColor="#990000" SetFocusOnError="True" ValidationExpression="^\d{10}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">ADDRESS</td>
                    <td>
                        <asp:TextBox ID="AddressTextBox" runat="server" Width="188px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ControlToValidate="AddressTextBox" Display="Dynamic" ErrorMessage="please Enter Address"
                            ForeColor="Maroon" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">USERNAME</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="UserNameTextBox" runat="server" Width="188px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="UserNameTextBox" Display="Dynamic" ErrorMessage="Please Enter UserName"
                            ForeColor="Maroon" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">PASSWORD</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="PassTextBox" runat="server" Width="188px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                            ControlToValidate="PassTextBox" Display="Dynamic" ErrorMessage="Please Enter Password"
                            ForeColor="Maroon" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ControlToValidate="PassTextBox" Display="Dynamic"
                            ErrorMessage="Please Enter A Strong Password" ForeColor="Maroon" SetFocusOnError="True"
                            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&amp;.])[A-Za-z\d@$!%*?&amp;.]{8,}$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">CONFIRM PASS</td>
                    <td class="auto-style5">
                        <asp:TextBox ID="ConfirmPassTextBox" runat="server" Width="188px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                            ControlToValidate="ConfirmPassTextBox" Display="Dynamic" ErrorMessage="Please Confirm password"
                            ForeColor="Maroon" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PassTextBox"
                            ControlToValidate="ConfirmPassTextBox" Display="Dynamic" ErrorMessage="Password is not identical"
                            ForeColor="Maroon" SetFocusOnError="True">*</asp:CompareValidator>
                    </td>
                </tr>

                <!-- PHOTO ROW -->
               <tr>
    <td class="auto-style3">PHOTO</td>
    <td>
        <asp:FileUpload ID="FileUploadPhoto" runat="server" />
    </td>
</tr>


                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button ID="Button1" runat="server" Text="SIGNUP" OnClick="Button1_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <a href="LOGIN.aspx">Go To Login form</a>
                    </td>
                </tr>
            </table>

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" BackColor="#CCCCCC" Font-Size="Medium" ForeColor="#990000" />
        </div>
    </form>
</body>
</html>

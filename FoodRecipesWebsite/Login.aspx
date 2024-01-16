<%@ Page Title="" Language="C#" MasterPageFile="~/Blankpage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FoodRecipesWebsite.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Food Recipes</title>
    <style>
       body{
            margin: 0;
            padding: 0;
            /* background: url(./img/loginImg.jpg); */
            font-family: sans-serif;
        }
        .loginbox{
            width: 320px;
            height: 475px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 0 15px 0 rgb(0 0 0 / 30%);
            color: black;
            top: 50%;
            left: 50%;
            position: absolute;
            transform: translate(-50%, -50%);
            box-sizing: border-box;
            padding: 70px 30px;
            transition: transform .5s;
        }

        .loginbox:hover{
            transform: translate(-50%, -51%);
        }

        h1{
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 22px;
        }

        .loginbox p{
            margin: 0;
            padding: 0;
            font-weight: bold;
        }

        .loginbox input{
            width: 100%;
            margin-bottom: 20px;
        }

        .loginbox input::placeholder{
          color: rgb(161, 161, 161);
        }

        .loginbox input[type = "text"], input[type = "password"]{
            border: none;
            border-bottom: 1px solid brown;
            background: transparent;
            outline: none;
            height: 40px;
            color: black;
            font-size: 14px;
        }

        .btn{
            border: none;
            outline: none;
            height: 40px;
            background-color: #ac4511;
            color: #fff;
            font-size: 18px;
            border-radius: 20px;
            display: block;
            padding-inline: 5em;
            margin-bottom: .4em;
        }

        .btn:hover{
            cursor: pointer;
            background: rgb(143, 67, 29);
        }

        .loginbox a{
            text-decoration: none;
            font-size: 12px;
            line-height: 20px;
            color: darkgray;
        }

        .loginbox a:hover{
            color: black;
        }
        .Message {
            color: Red;
            font-size: 0.8em;
            margin-top: -10px;
        }
    </style>
</head>
<body>
    <div class="loginbox">
        <h1>Login</h1>
        <asp:Label ID="ErrorMessageLabel" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        <p>Username</p>
        <asp:TextBox ID="Username" runat="server" type="text" placeholder="Enter Username" onkeyup="main()"></asp:TextBox>
        <div class="Message">
        <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ControlToValidate="Username" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
         <p>Password</p>
        <asp:TextBox ID="Password" runat="server" type="password" onkeyup="main()" placeholder="Enter Password"></asp:TextBox>
        <div class="Message">
        <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="Password" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <asp:Button ID="submitBtn" class="btn" type="submit" name="submit" runat="server" Text="Login" OnClick="submitBtn_Click" />
        <a href="resetpassword.aspx">Forgot your password?</a><br>
        <a href="Sign-Up.aspx" target="_blank" class="ar">Don't have an account?Signup</a>
    </div>
</body>
</html>
</asp:Content>

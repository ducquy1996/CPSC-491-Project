using BELibrary.Core.Entity;
using BELibrary.Entity;
using BELibrary.Utils;
using ELearning.Areas.Admin.Authorization;
using ELearning.Areas.Admin.Models;
using System;
using System.Web;
using System.Web.Mvc;

namespace ELearning.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Administrator/Login/

        [HttpGet]
        public ActionResult Index(string ReturnUrl = "")
        {
            if (CookiesManage.Logined())
            {
                return RedirectToAction("Index", "Dashboard");
            }
            ViewBag.ReturnUrl = ReturnUrl;
            return View();
        }

        public JsonResult ChangePass(string oldPass, string newPass, string reNewPass)
        {
            if (Session[SessionKey.Admin] != null)
            {
                User user = (User)Session[SessionKey.Admin];
                if (!user.Password.Equals(oldPass))
                {
                    return Json(new { status = false, mess = "Old passwords does not match!" });
                }
                if (!newPass.Equals(reNewPass))
                {
                    return Json(new { status = false, mess = "Password incorrect!" });
                }
                var unitOfWork = new UnitOfWork(new ELearningDBContext());
                var us = unitOfWork.Account.ValidBEAccount(user.Username, user.Password);
                us.Password = newPass;
                unitOfWork.Complete();
                return Json(new { status = true, mess = "Password changed successfully!", url = "/Login/Logout" });
            }
            return Json(new { status = "login", mess = "Re-login!", url = "/Login/Index" });
        }

        [HttpPost]
        [ValidateInput(true)]
        public JsonResult CheckLogin(LoginModel model)
        {
            var unitofwork = new UnitOfWork(new ELearningDBContext());
            var account = unitofwork.Account.ValidBEAccount(model.Username, model.Password);

            if (account != null)
            {
                //đăng nhập thành công
                string cookieclient = account.Username;
                string decodecookieclient = CryptorEngine.Encrypt(cookieclient, true);
                HttpCookie usercookie = new HttpCookie("name_client")
                {
                    Value = decodecookieclient,
                    Expires = DateTime.Now.AddDays(30)
                };
                HttpContext.Response.Cookies.Add(usercookie);
                return Json(new { status = true, mess = "Login Success" });
            }
            else
            {
                return Json(new { status = false, mess = "User or Password Not Correct" });
            }
        }

       

        [HttpGet]
        public ActionResult Logout()
        {
            HttpCookie namecookie = Request.Cookies["name_client"];
            if (namecookie != null)
            {
                HttpCookie myCookie = new HttpCookie("name_client")
                {
                    Expires = DateTime.Now.AddDays(-1d)
                };
                Response.Cookies.Add(myCookie);
            }
            return Redirect("/admin/login");
        }
    }
}
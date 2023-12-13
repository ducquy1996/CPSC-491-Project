using BELibrary.Core.Entity;
using BELibrary.Entity;
using BELibrary.Utils;
using System;
using System.Linq;
using System.Web.Mvc;
using ELearning.Areas.Admin.Authorization;

namespace ELearning.Areas.Admin.Controllers
{
    [Permission(Role = RoleKey.Admin)]
    public class MUserController : BaseController
    {
        public ActionResult Index(int role)
        {
            if (!RoleKey.Any(role))
            {
                return Redirect("/admin");
            }

            ViewBag.Element = RoleKey.GetRoleText(role);
            ViewBag.Role = role;
            using (var workScope = new UnitOfWork(new ELearningDBContext()))
            {
                var listData = workScope.Account.GetAll().Where(x => x.RoleId == role).ToList();
                return View(listData);
            }
        }

        public ActionResult Create(int role)
        {
            ViewBag.key = "Create";
            ViewBag.Element = RoleKey.GetRoleText(role);

            ViewBag.isEdit = false;
            ViewBag.Role = role;
            ViewBag.Genders = new SelectList(GenderKey.GetDic(), "Key", "Value");
            ViewBag.Roles = new SelectList(RoleKey.GetDic(), "Key", "Value");

            return View();
        }

        public ActionResult Update(string username, int role)
        {
            ViewBag.isEdit = true;
            ViewBag.Role = role;
            ViewBag.key = "Update";

            ViewBag.Element = RoleKey.GetRoleText(role);
            ViewBag.Genders = new SelectList(GenderKey.GetDic(), "Key", "Value");
            ViewBag.Roles = new SelectList(RoleKey.GetDic(), "Key", "Value");

            using (var workScope = new UnitOfWork(new ELearningDBContext()))
            {
                var acc = workScope.Account.FirstOrDefault(x => x.Username == username);
                acc.Password = "";
                return View("Create", acc);
            }
        }

        [HttpPost]
        public JsonResult CreateOrEdit(User input, bool isEdit)
        {
            if (GetCurrentUser() != null && GetCurrentUser().RoleId == RoleKey.Admin)
            {
                try
                {
                    if (isEdit) //update
                    {
                        using (var workScope = new UnitOfWork(new ELearningDBContext()))
                        {
                            var elm = workScope.Account.FirstOrDefault(x => x.Username == input.Username);
                            if (elm != null) //update
                            {
                                //xu ly password

                                var passwordFactory = input.Password + VariableExtensions.KeyCryptor;
                                var passwordCrypto = CryptorEngine.Encrypt(passwordFactory, true);

                                input.Password = passwordCrypto != elm.Password ? passwordCrypto : elm.Password;
                                elm = input;

                                workScope.Account.Put(elm, elm.Username);
                                workScope.Complete();
                                return Json(new { status = true, mess = "Updated" });
                            }
                            else
                            {
                                return Json(new { status = false, mess = "Not Exist " });
                            }
                        }
                    }
                    else
                    {
                        using (var workScope = new UnitOfWork(new ELearningDBContext()))
                        {
                            var passwordFactory = input.Password + VariableExtensions.KeyCryptor;
                            var passwordCrypto = CryptorEngine.Encrypt(passwordFactory, true);
                            input.Password = passwordCrypto;
                            workScope.Account.Add(input);
                            workScope.Complete();
                            return Json(new { status = true, mess = "Added" });
                        }
                    }
                }
                catch (Exception ex)
                {
                    return Json(new { status = false, mess = "Error Occur: " + ex.Message });
                }
            }
            else
            {
                return Json(new { status = false, mess = "You have no authority" });
            }
        }

        [HttpPost]
        public JsonResult Del(int id)
        {
            try
            {
                using (var workScope = new UnitOfWork(new ELearningDBContext()))
                {
                    var elm = workScope.Lectures.Get(id);
                    if (elm != null) //update
                    {
                        workScope.Lectures.Remove(elm);
                        workScope.Complete();
                        return Json(new { status = true, mess = "Deleted " });
                    }
                    else
                    {
                        return Json(new { status = false, mess = "Not Exist " });
                    }
                }
            }
            catch
            {
                return Json(new { status = false, mess = "Fail" });
            }
        }
    }
}
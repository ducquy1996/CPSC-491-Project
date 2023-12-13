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
    public class MCourseController : BaseController
    {
        private string keyElement = "Course";

        public ActionResult Index()
        {
            ViewBag.Element = keyElement;
            using (var unitofwork = new UnitOfWork(new ELearningDBContext()))
            {
                var listData = unitofwork.Courses.GetAll().ToList();
                return View(listData);
            }
        }

        public ActionResult Create()
        {
            ViewBag.key = "Create";
            ViewBag.Element = keyElement;

            ViewBag.isEdit = false;

            using (var unitofwork = new UnitOfWork(new ELearningDBContext()))
            {
                ViewBag.LangCode = new SelectList(LangCode.GetDic(), "Key", "Value");
            }

            return View();
        }

        public ActionResult Update(int id)
        {
            ViewBag.isEdit = true;
            ViewBag.key = "Update";
            ViewBag.Element = keyElement;
            using (var unitofwork = new UnitOfWork(new ELearningDBContext()))
            {
                ViewBag.LangCode = new SelectList(LangCode.GetDic(), "Key", "Value");

                var article = unitofwork.Courses.FirstOrDefault(x => x.Id == id);
                return View("Create", article);
            }
        }

        [HttpPost, ValidateInput(false)]
        public JsonResult CreateOrEdit(Course input, bool isEdit)
        {
            try
            {
                if (isEdit) //update
                {
                    using (var unitofwork = new UnitOfWork(new ELearningDBContext()))
                    {
                        var elm = unitofwork.Courses.Get(input.Id);
                        if (elm != null) //update
                        {
                            input.CreatedBy = elm.CreatedBy;
                            input.CreatedDate = elm.CreatedDate;
                            elm = input;
                            elm.ModifiedBy = GetCurrentUser().FullName;
                            elm.ModifiedDate = DateTime.Now;
                            unitofwork.Courses.Put(elm, elm.Id);
                            unitofwork.Complete();
                            return Json(new { status = true, mess = "Success" });
                        }
                        else
                        {
                            return Json(new { status = false, mess = "Not exist " + keyElement });
                        }
                    }
                }
                else
                {
                    using (var unitofwork = new UnitOfWork(new ELearningDBContext()))
                    {
                        input.CreatedBy = GetCurrentUser().FullName;
                        input.CreatedDate = DateTime.Now;
                        input.ModifiedBy = GetCurrentUser().FullName;
                        input.ModifiedDate = DateTime.Now;

                        unitofwork.Courses.Add(input);

                        unitofwork.Complete();
                        return Json(new { status = true, mess = "Success" + keyElement });
                    }
                }
            }
            catch (Exception ex)
            {
                return Json(new { status = false, mess = "Error : " + ex.Message });
            }
        }

        [HttpPost]
        public JsonResult Del(int id)
        {
            try
            {
                using (var unitofwork = new UnitOfWork(new ELearningDBContext()))
                {
                    var elm = unitofwork.Courses.Get(id);
                    if (elm != null) //update
                    {
                        unitofwork.Courses.Remove(elm);
                        unitofwork.Complete();
                        return Json(new { status = true, mess = "Success" + keyElement });
                    }
                    else
                    {
                        return Json(new { status = false, mess = "Not exist " + keyElement });
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
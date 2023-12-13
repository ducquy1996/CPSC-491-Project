using BELibrary.Core.Entity;
using BELibrary.Entity;
using System;
using System.Linq;
using System.Web.Mvc;
using BELibrary.Utils;

namespace ELearning.Areas.Admin.Controllers
{
    public class MTestController : BaseController
    {
        private readonly string keyElement = "Exam";

        public ActionResult Index(int lectureId)
        {
            ViewBag.Element = keyElement;
            using (var workScope = new UnitOfWork(new ELearningDBContext()))
            {
                var user = GetCurrentUser();
                if (user.RoleId == RoleKey.Admin)
                {
                    var listData = workScope.StudentTests.Include(x => x.User).Where(x => x.LectureId == lectureId).ToList();
                    return View(listData);
                }
                else
                {
                    var subjectAssign =
                        workScope.TeacherSubjects.Query(x => x.Username.ToLower() == user.Username.ToLower());

                    var subjects = workScope.Subjects.GetAll().Join(
                        subjectAssign,
                        sj => sj.Id,
                        sja => sja.SubjectId,
                        (sj, sja) => new { sj }).Select(x => x.sj).Where(x => x.Status).ToList();

                    var lectures = workScope.Lectures.GetAll().Join(
                        subjects,
                        l => l.SubjectId,
                        sj => sj.Id,
                        (l, sj) => new { l }).Select(x => x.l).ToList();

                    var studentTests = workScope.StudentTests.GetAll().Join(
                        lectures,
                        st => st.LectureId,
                        l => l.Id,
                        (st, l) => new { st }).Select(x => x.st).ToList();

                    return View(studentTests);
                }
            }
        }

        public ActionResult Update(int id)
        {
            ViewBag.isEdit = true;
            ViewBag.key = "Update";
            ViewBag.Element = keyElement;
            using (var workScope = new UnitOfWork(new ELearningDBContext()))
            {
                var user = GetCurrentUser();
                if (user.RoleId == RoleKey.Admin)
                {
                    var student = workScope.StudentTests.FirstOrDefault(x => x.Id == id);

                    return View(student);
                }
                else
                {
                    var subjectAssign =
                        workScope.TeacherSubjects.Query(x => x.Username.ToLower() == user.Username.ToLower());

                    var subjects = workScope.Subjects.GetAll().Join(
                        subjectAssign,
                        sj => sj.Id,
                        sja => sja.SubjectId,
                        (sj, sja) => new { sj }).Select(x => x.sj).Where(x => x.Status).ToList();

                    var lectures = workScope.Lectures.GetAll().Join(
                        subjects,
                        l => l.SubjectId,
                        sj => sj.Id,
                        (l, sj) => new { l }).Select(x => x.l).ToList();

                    var studentTests = workScope.StudentTests.GetAll().Join(
                        lectures,
                        st => st.LectureId,
                        l => l.Id,
                        (st, l) => new { st }).Select(x => x.st);

                    var studentTest = studentTests.FirstOrDefault(x => x.Id == id);

                    if (studentTest == null)
                    {
                        return RedirectToAction("E401", "Dashboard");
                    }
                    return View(studentTest);
                }
            }
        }

        [HttpPost, ValidateInput(false)]
        public JsonResult CreateOrEdit(StudentTest input, bool isEdit)
        {
            try
            {
                if (!isEdit) return Json(new { status = false, mess = "Error Occur: " });
                using (var workScope = new UnitOfWork(new ELearningDBContext()))
                {
                    var elm = workScope.StudentTests.Get(input.Id);
                    if (elm != null) //update
                    {
                        elm.Point = input.Point;
                        elm.ReplyFile = input.ReplyFile;

                        workScope.StudentTests.Put(elm, elm.Id);
                        workScope.Complete();
                        return Json(new { status = true, mess = "Updated" });
                    }
                    else
                    {
                        return Json(new { status = false, mess = "Not Exist " + keyElement });
                    }
                }
            }
            catch (Exception ex)
            {
                return Json(new { status = false, mess = "Error Occur: " + ex.Message });
            }
        }

        [HttpPost]
        public JsonResult Del(int id)
        {
            try
            {
                using (var workScope = new UnitOfWork(new ELearningDBContext()))
                {
                    var elm = workScope.StudentTests.Get(id);
                    if (elm != null) //update
                    {
                        workScope.StudentTests.Remove(elm);
                        workScope.Complete();
                        return Json(new { status = true, mess = "Deleted " + keyElement });
                    }
                    else
                    {
                        return Json(new { status = false, mess = "Not Exist " + keyElement });
                    }
                }
            }
            catch
            {
                return Json(new { status = false, mess = "Failed" });
            }
        }
    }
}
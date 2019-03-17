using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class UnitOfWork
    {
        public SozlukContext db;

        public UnitOfWork()
        {
            if (db == null)
                db = Create();

            Languages = new BaseRepository<Language, int>(db);
            Words = new WordRepository(db);
            WordRequests = new BaseRepository<WordRequest, int>(db);
            TranslateManager = new TranslateManager(db);
        }

        public static SozlukContext Create()
        {
            return new SozlukContext();
        }

        public bool Complete()
        {
            try
            {
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public BaseRepository<Language, int> Languages;
        public WordRepository Words;
        public BaseRepository<WordRequest, int> WordRequests;
        public TranslateManager TranslateManager;
    }
}

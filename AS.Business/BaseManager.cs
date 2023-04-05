using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Core.ValueObjects;
using AS.Entities.Base;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;

namespace AS.Business
{
    public class BaseManager<TEntity, TMapTo> : IBaseService<TEntity, TMapTo>
        where TEntity : class, IEntity, new()
        where TMapTo : class, IDto, new()
    {

        protected readonly IRepository<TEntity> _repository;
        protected IMapper _mapper;


        public BaseManager(IRepository<TEntity> repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }


        public async Task<ListModel<TMapTo>> BaseGetAll()
        {
            var listModel = new ListModel<TMapTo>();
            var entitys = await _repository.GetAll();
            listModel.Items = await entitys.ProjectTo<TMapTo>(_mapper.ConfigurationProvider).ToListAsync();

                                 
            return listModel;
        }

        public async Task<TMapTo?> BaseGetById(Guid id)
        {
            var entity = await _repository.GetAsync(p=>p.Id == id);

            if(entity == null)
            {
                throw new Exception("Kayýt bulunamadý.");
            }

            var tMapTo = _mapper.Map(entity, new TMapTo());

            return tMapTo;
        }

        public async Task<TMapTo> BaseInsert(TMapTo model)
        {
           var tEntity = _mapper.Map(model, new TEntity());

            tEntity = BaseEntityHelper.SetBaseEntitiy(tEntity);

            tEntity.Id = Guid.NewGuid();
            tEntity.IsApproved = true;

            return _mapper.Map(await _repository.InsertAsync(tEntity), new TMapTo());
        }

        public async Task<TMapTo> BaseUpdate(TMapTo model)
        {

            var tEntity = _repository.Get(p => p.Id == model.Id);

            if(tEntity == null)
            {

                return null;
            }
            tEntity = _mapper.Map(model, tEntity);


            tEntity = BaseEntityHelper.SetBaseUpdateEntitiy(tEntity);               


            return _mapper.Map(await _repository.UpdateAsync(tEntity), new TMapTo());
        }

        public void BaseDelete(Guid id)
        {
            _repository.Delete(id);

        }
    }

}

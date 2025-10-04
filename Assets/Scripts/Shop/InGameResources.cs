using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace Shop
{
    public class InGameResources : MonoBehaviour
    {
        [SerializeField] private List<ResourceTypes> resourceTypes;
        [SerializeField] private Button tarhuniumButton;
        [SerializeField] private Button kolikiButton;
        [SerializeField] private Button pantaloniButton;

        private ResourceTypes _curentResource;

        public List<ResourceTypes> GetResourceTypes() => resourceTypes;

        private void Start()
        {
            if (resourceTypes != null) _curentResource = resourceTypes[0]; 
            tarhuniumButton.onClick.AddListener(() => ChangeResource(Resource.tarhunium));
            kolikiButton.onClick.AddListener(() => ChangeResource(Resource.koliki));
            pantaloniButton.onClick.AddListener(() => ChangeResource(Resource.pantaloni));
        }

        private void Update()
        {
            _curentResource.TimeUpdate(Time.deltaTime);
        }

        private void ChangeResource(Resource type)
        {
            foreach (var resource in resourceTypes)
            {
                if (resource.ResourceType == type)
                {
                    _curentResource = resource;
                }
            }
        }

        public void DecreaseCount(Resource type, int count)
        {
            foreach (var resource in resourceTypes)
            {
                if (resource.ResourceType == type)
                {
                    resource.Count -= count;
                }
            }
        }
    }

    [Serializable]
    public class ResourceTypes 
    {
        public Resource ResourceType;
        public int Count;
        public float TimeToGather;

        private float _timer;

        public ResourceTypes(Resource resourceType, int count, float timeToGather)
        {
            ResourceType = resourceType;
            Count = count;
            TimeToGather = timeToGather;
        }

        public void TimeUpdate(float deltaTime)
        {
            _timer += deltaTime;
            if (_timer >= TimeToGather)
            {
                _timer = 0;
                Count++;
            }
        }
    }

    public enum Resource
    {
        tarhunium,
        koliki,
        pantaloni
    }
}
using System.Collections.Generic;
using Abilities.Passive;
using Audio;
using GameConfiguration;
using Towers;
using Towers.Abilities.Active;
using UI.InGame;
using UnityEngine;
using UnityEngine.UI;

namespace Shop
{
    public class BuyingSystem : MonoBehaviour
    {
        [SerializeField] private Sprite plusIcon;
        
        [SerializeField] private List<GameObject> activeAbilities;

        [SerializeField] private List<GameObject> passiveAbilities;

        [SerializeField] private List<GameObject> randomActiveAbilities;
        
        [SerializeField] private List<GameObject> randomPassiveAbilities;

        [SerializeField] private List<GameObject> objectsForRandomActiveAbilities;
        
        [SerializeField] private List<GameObject> objectsForRandomPassiveAbilities;

        [SerializeField] private GameObject abilitiesObj;

        private AbilitiesSlots _tower;

        public void GetTower(AbilitiesSlots tower)
        {
            _tower = tower;
        }

        public void SetRandomActiveAbilities(Button button)
        {
            if (button.transform.GetChild(0).gameObject.transform.childCount == 0)
            {
                if (!_tower.ActivesShowed)
                {
                    RandomGetActiveAbilities();
        
                    for (int i = 0; i < objectsForRandomActiveAbilities.Count; i++)
                    { 
                        Instantiate(randomActiveAbilities[i], objectsForRandomActiveAbilities[i].transform.position, Quaternion.identity,
                            objectsForRandomActiveAbilities[i].transform);
                    }

                    _tower.ActivesShowed = true;
                }
                else
                {
                    SetDetectedActiveAbilities();
                }
            }
        }

        public void SetRandomPassiveAbilities(Button button)
        {
            if (button.transform.GetChild(0).gameObject.transform.childCount == 0)
            {
                if (!_tower.PassivesShowed)
                {
                    RandomGetPassiveAbilities();

                    for (int i = 0; i < objectsForRandomPassiveAbilities.Count; i++)
                    {
                        Instantiate(randomPassiveAbilities[i], objectsForRandomPassiveAbilities[i].transform.position,
                            Quaternion.identity,
                            objectsForRandomPassiveAbilities[i].transform);
                    }
                    
                    _tower.PassivesShowed = true;
                }
                else
                {
                    SetDetectedPassiveAbilities();
                }
            }
        }

        private void SetDetectedActiveAbilities()
        {
            if (_tower.ActivesShowed)
            {
                for (int i = 0; i < _tower.RandomActiveAbilities.Count; i++)
                { 
                    Instantiate(_tower.RandomActiveAbilities[i], objectsForRandomActiveAbilities[i].transform.position, Quaternion.identity,
                        objectsForRandomActiveAbilities[i].transform);
                }
            }
        }
        
        private void SetDetectedPassiveAbilities()
        {
            if (_tower.PassivesShowed)
            {
                for (int i = 0; i < _tower.RandomPassiveAbilities.Count; i++)
                { 
                    Instantiate(_tower.RandomPassiveAbilities[i], objectsForRandomPassiveAbilities[i].transform.position, Quaternion.identity,
                        objectsForRandomPassiveAbilities[i].transform);
                }
            }
        }

        public void ResetLists()
        {
            randomActiveAbilities.Clear();
            randomPassiveAbilities.Clear();
            
            foreach (var obj in objectsForRandomActiveAbilities)
            {
                if (obj.transform.childCount != 0)
                {
                    Destroy(obj.transform.GetChild(0).gameObject);
                }
                
                obj.SetActive(false);
            }
            
            foreach (var obj in objectsForRandomPassiveAbilities)
            {
                if (obj.transform.childCount != 0)
                {
                    Destroy(obj.transform.GetChild(0).gameObject);
                }
                
                obj.SetActive(false);
            }
        }

        private void RandomGetActiveAbilities()
        {
            List<GameObject> temp = new List<GameObject>(activeAbilities);

            for (int i = 0; i < 3; i++)
            {
                var rand = Random.Range(0, temp.Count);
            
                randomActiveAbilities.Add(temp[rand]);

                temp.Remove(temp[rand]);
            }

            foreach (var abil in randomActiveAbilities)
            {
                if (_tower.RandomActiveAbilities.Count < 3)
                {
                    _tower.RandomActiveAbilities.Add(abil);
                }
            }
        }
    
        private void RandomGetPassiveAbilities()
        {
            List<GameObject> temp = new List<GameObject>(passiveAbilities);

            for (int i = 0; i < 3; i++)
            {
                var rand = Random.Range(0, temp.Count);
            
                randomPassiveAbilities.Add(temp[rand]);

                temp.Remove(temp[rand]);
            }

            foreach (var abil in randomPassiveAbilities)
            {
                if (_tower.RandomPassiveAbilities.Count < 3)
                {
                    _tower.RandomPassiveAbilities.Add(abil);
                }
            }
        }

        public void GetButtonsUpgrade(Button button)
        {
            for (int i = 0; i < button.transform.childCount; i++)
            {
                button.transform.GetChild(i).gameObject.SetActive(!button.transform.GetChild(i).gameObject.activeSelf);
                Button upgradeButton = button.transform.GetChild(i).transform.GetChild(0).GetComponent<Button>();
                int upgradeIndex = i;
                upgradeButton.onClick.AddListener(() => OnAbilitySelected(button, upgradeButton, upgradeIndex));
            }
        }

        public void SetAbilityOnTower(Button upgrade)
        {
            var temp = Instantiate(upgrade.gameObject, abilitiesObj.transform);
            _tower.Abilities.Add(temp);
            _tower.CheckForActiveAbility();
        }
        
        private void OnAbilitySelected(Button selectedSlot, Button chosenUpgrade, int upgradeIndex)
        {
            float tempCost;
            if (selectedSlot.CompareTag("Active")) 
            {
                tempCost = chosenUpgrade.gameObject.GetComponent<ActiveAbility>()
                    .Cost();
            }
            else
            {
                tempCost = chosenUpgrade.gameObject.GetComponent<PassiveAbilities>()
                    .Cost();
            }

            if (tempCost <= SoulsCounter.Instance.Dreams)
            {
                SetAbilityOnTower(chosenUpgrade);
                ResetLists();
                SoulsCounter.Instance.Dreams -= tempCost;
                AudioManager.instance.PlaySFX("Coin");
            }
            else
            {
                return;
            }

            for (int i = 0; i < selectedSlot.transform.childCount; i++)
            {
                selectedSlot.transform.GetChild(i).gameObject.SetActive(false);
            }

            if (selectedSlot.gameObject.CompareTag("Active"))
            {
                Image slotImage = selectedSlot.GetComponent<Image>();
                Image upgradeImage = chosenUpgrade.GetComponent<Image>();
                slotImage.sprite = upgradeImage.sprite;
                
                DisableSlotWithoutChangingAppearance(selectedSlot);
            }
            else
            {
                _tower.PassivesShowed = false;
                _tower.RandomPassiveAbilities.Clear();
            }
            
            HidePassiveAbilities();
            
            SetPassivesImages();
        }
        
        private void DisableSlotWithoutChangingAppearance(Button slotButton)
        {
            ColorBlock colors = slotButton.colors;
            colors.disabledColor = colors.normalColor;
            slotButton.colors = colors;

            slotButton.interactable = false;
        }

        public void ActivateActiveSlot(Button slotButton)
        {
            if (!_tower.HasActiveAbility)
            {
                slotButton.interactable = true;
                slotButton.gameObject.GetComponent<Image>().sprite = plusIcon;
            }
            else
            {
                slotButton.gameObject.GetComponent<Image>().sprite = _tower.Ability.GetComponent<Image>().sprite;
                slotButton.interactable = false;
            }
        }

        public void SetPassivesImages()
        {
            _tower.SetAbilitiesImages();
        }

        public void HidePassiveAbilities()
        {
            _tower.HideAbilities();
        }

        public void CloseShop()
        {
            if (!GameConfig.Instance.IsInTower)
            {
                HidePassiveAbilities();
            }
            ResetLists();
            GameConfig.Instance.ShopIsOpened = false;
        }
    }
}

using System.Collections;
using System.Collections.Generic;
using Audio;
using UnityEngine;
using Random = UnityEngine.Random;

namespace GameConfiguration.Spawners
{
    public class Spawner : MonoBehaviour
    {
        [SerializeField] private GameObject bubble;

        private Vector3 _transformBubble;
    
        private GameConfig _gameConfig;

        public float MaxTimeToSpawn = 4;

        public float MinTimeToSpawn = 2;

        [SerializeField] private List<GameObject> _enemies;

        private void Start()
        {
            _gameConfig = GetComponentInParent<GameConfig>();
            _transformBubble = transform.position;
            _transformBubble.y += 1f;
        }

        public IEnumerator StartSpawn()
        {
            AudioManager.instance.PlaySFX("SpawnMobs");
            foreach (var enemy in _enemies)
            {
                StartCoroutine(SpawnEnemy(enemy));
                Instantiate(bubble, _transformBubble, Quaternion.identity, transform);
                var randTime = Random.Range(MinTimeToSpawn, MaxTimeToSpawn);
                yield return new WaitForSeconds(randTime);
            }
            _enemies.Clear();
        }

        public void SetEnemies(GameObject enemy)
        {
            _enemies.Add(enemy);
        }

        private IEnumerator SpawnEnemy(GameObject enemy)
        {
            yield return new WaitForSeconds(3.75f);
            var temp = Instantiate(enemy, transform.position, Quaternion.identity, transform);
            _gameConfig.enemyList.Add(temp);
        }

        public IEnumerator SpawnBoss(GameObject boss)
        {
            var temp = Instantiate(boss, transform.position, Quaternion.identity, transform);
            _gameConfig.enemyList.Add(temp);
            yield return new WaitForSeconds(1f);
        }
    }
}

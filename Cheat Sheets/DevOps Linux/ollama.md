## CLI

    ollama list
    ollama pull <model>
    ollama run <model>

## Checking HW

Find out the amount of VRAM

    lspci -v | grep -A 20 VGA

In the output watch for `Memory at`:

    0000:00:02.0 VGA compatible controller: Intel Corporation TigerLake-LP GT2 [Iris Xe Graphics] (rev 01) (prog-if 00 [VGA controller])
    	[...]
    	Memory at 6078000000 (64-bit, non-prefetchable) [size=16M]
    	Memory at 4000000000 (64-bit, prefetchable) [size=256M]         <<<--- 256 MB VRAM not really good :-)
    	[...]

Check for AVX 512 support

    cat /proc/cpuinfo | grep avx512

Ressource threshold to decide which models to run locally

| GPU         | RAM   | VRAM        | Models / Quantization               |
|-------------|-------|-------------|-------------------------------------|
| no          | 16GB  | <8 GB       | smallest 3B models only, 4-bit GGUF |
| yes         | 32GB  | 8 GB        | up to 7B models, q2-3               |
| yes         | 128GB | 16 GB       | up to 13B models, GGUF/EXL2         |
| yes         | 128GB | 24 GB       | up to 30B models                    |

## Simple API usage with curl

Get available model names with

    curl http://localhost:11434/api/tags

For a local installation you can use curl like this

    curl http://localhost:11434/api/generate -d '{
      "model": "qwen2.5-coder:1.5b",
      "prompt": "Why is the sky blue? Give the shortest answer possible in under 20 words",
      "stream": false
    }'

and will receive a response like this

    {
      "model": "qwen2.5-coder:1.5b",
      "created_at": "2025-07-14T09:36:10.352299625Z",
      "response": "Because of the Earth's atmosphere.",
      "done": true,
      "done_reason": "stop",
      "context": [
        151644,
        8948,
      [...]
        594,
        16566,
        13
      ],
      "total_duration": 1251770025,
      "load_duration": 77477704,
      "prompt_eval_count": 46,
      "prompt_eval_duration": 721473474,
      "eval_count": 8,
      "eval_duration": 451629068
    }

                        [[ "$__arg" = "[[" ]] && __style=${FAST_THEME_NAME}builtin || __style=${FAST_THEME_NAME}reserved-word
                        if [[ $__arg == $'\x7b' ]]; then # {
                          braces_stack='Y'"$braces_stack"
                        elif [[ $__arg == $'\x7d' && $braces_stack[1] == "Y" ]]; then # }
                          # We're at command word, so no need to check right_brace_is_recognised_everywhere
                          braces_stack[1]=""
                          __style=${FAST_THEME_NAME}reserved-word
                          (( next_word = next_word | 16 ))
                        elif [[ $__arg == "[[" ]]; then
                          braces_stack='A'"$braces_stack"
                        elif [[ $__arg == "for" ]]; then
                          (( next_word = next_word | 32 )) # BIT_for
                        elif [[ $__arg == "case" ]]; then
                          (( next_word = BIT_case_preamble ))
                        fi

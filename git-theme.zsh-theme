function get_status_segment() {
    local success_color=${THEME_STATUS_SUCCESS_COLOR:-'green'}
    local failure_color=${THEME_STATUS_FAILURE_COLOR:-'red'}
    local success_icon=${THEME_STATUS_SUCCESS_ICON-'➜ '}
    local failure_icon=${THEME_STATUS_FAILURE_ICON-'➜ '}
    echo "%(?:%F{$success_color}$(echo $success_icon):%F{$failure_color}$(echo $failure_icon))%f"
}

function get_user_segment() {
    local prefix=${THEME_USER_PREFIX-'%F{172}\uf296  '}
    local suffix=${THEME_USER_SUFFIX}
    local user_color=${THEME_USER_COLOR:-'yellow'}

    echo "$prefix%F{$user_color}%n%f$suffix"
}

function get_end_segment() {
    local end_icon=${THEME_END_ICON-'\uf105'}
    local end_color=${THEME_END_COLOR-'gray'}
    echo "%F{$end_color}$(echo $end_icon)%f"
}

function get_dir_segment() {
    local home_icon=${THEME_END_ICON-'\uf46d '}
    local dir_color=${THEME_END_COLOR-'green'}
    local dir=$(pwd)
    echo "%F{$dir_color}${dir/${HOME}/$home_icon}%f"
}

function get_prompt() {
    local default_format="%s %u %d %e "
    local format=${THEME_FORMAT-$default_format}
    placeholder="${format/\%s/$(get_status_segment)}"
    placeholder="${placeholder/\%u/$(get_user_segment)}"
    placeholder="${placeholder/\%e/$(get_end_segment)}"
    placeholder="${placeholder/\%d/$(get_dir_segment)}"
    echo $placeholder
}

PROMPT='$(get_prompt)'

-- rime.lua
-- 港话通 (KongType) RIME 定制脚本

-- 1. 粤拼音调与释义滤镜 (Jyutping Annotation Filter)
function kongtype_jyutping_filter(input, env)
    for cand in input:iter() do
        -- 为候选词注入粤拼与普通话对应提示
        if cand.comment == "" then
            cand:get_genuine().comment = "〔港粤〕"
        end
        yield(cand)
    end
end

-- 2. 云端 AI 实时长句增强 Translator (可选连接本地服务)
function kongtype_cloud_translator(input, seg)
    if string.len(input) > 8 then
        -- 针对长句输入提供地道港话推荐
    end
end

-- 3. 当前日期与时间辅助
function date_translator(input, seg)
    if (input == "date" or input == "rq") then
        yield(Candidate("date", seg.start, seg._end, os.date("%Y年%m月%d日"), "〔日期〕"))
    end
    if (input == "time" or input == "sj") then
        yield(Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), "〔時間〕"))
    end
end

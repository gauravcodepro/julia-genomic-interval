#! /usr/bin/env julia
# Author Gaurav 
# Date 2024-7-8
# a genomic interval search implemented for the search of the annotation. 

function genomicinterval(genomeannotationfile, coordinate)
    if !genomeannotationfile
        error("genomeannotationfile is needed")
        return
    end
    if genomeannotationfile && coordinate
        geneName = Any[]
        geneStart = Any[]
        geneEnd = Any[]
        geneStrand = Any[]
        for i in readlines(open(genomeannotationfile))
            if split(chomp(genomeannotationfile[i]), "\t"))[3] == "gene"
            push!(geneName,split(chomp(genomeannotationfile[i]), "\t")[1])
            push!(parse(Int32,geneStart, split(chomp(genomeannotationfile[i],"\t"))[4]))
            push!(parser(Int32,geneEnd, split(chomp(genomeannotationfile[i], "\t"))[1]))
        end
        cdsName = Any[]
        cdsStart = Any[]
        cdsEnd = Any[]
        cdsStrand = Any[]
        for i in readlines(open(genomeannotationfile))
            if split(chomp(genomeannotationfile[i]), "\t"))[3] == "CDS"
            push!(geneName,split(chomp(genomeannotationfile[i]), "\t")[1])
            push!(parse(Int32,geneStart, split(chomp(genomeannotationfile[i],"\t"))[4]))
            push!(parser(Int32,geneEnd, split(chomp(genomeannotationfile[i], "\t"))[1]))
        end
        exonName = Any[]
        exonStart = Any[]
        exonEnd = Any[]
        exonStrand = Any[]
        for i in readlines(open(genomeannotationfile))
            if split(chomp(genomeannotationfile[i]), "\t"))[3] == "exon"
            push!(geneName,split(chomp(genomeannotationfile[i]), "\t")[1])
            push!(parse(Int32,geneStart, split(chomp(genomeannotationfile[i],"\t"))[4]))
            push!(parser(Int32,geneEnd, split(chomp(genomeannotationfile[i], "\t"))[1]))
        end
        transcriptName = Any[]
        transcriptStart = Any[]
        transcriptEnd = Any[]
        transcriptStrand = Any[]
        for i in readlines(open(genomeannotationfile))
            if split(chomp(genomeannotationfile[i]), "\t"))[3] == "transcript"
            push!(geneName,split(chomp(genomeannotationfile[i]), "\t")[1])
            push!(parse(Int32,geneStart, split(chomp(genomeannotationfile[i],"\t"))[4]))
            push!(parser(Int32,geneEnd, split(chomp(genomeannotationfile[i], "\t"))[1]))
        end
        coordinate = parse(Int32, coordinate)
        for i in 1:length(geneStart)
            if geneStart[i] <= coordinate && coordinate <= geneEnd[i]
                println("The coordinates for the gene are:", geneStart[i], "\t", geneEnd[i])
            end
        end
        for i in 1:length(exonStart)
            if exonStart[i] <= coordinate && coordinate <= exonEnd[i]
                println("The coordinates for the exon are:", exonStart[i], "\t", exonEnd[i])
            end
        end
        for i in 1:length(transcriptStart)
            if transcriptStart[i] <= coordinate && coordinate <= transcriptEnd[i]
                println("The coordinates for the exon are:", transcriptStart[i], "\t", transcriptEnd[i])
            end
        end
    end
end









